import 'package:clothing_app/main_body/constants/paystack_payment.dart';
import 'package:clothing_app/main_body/constants/transactions_page.dart';
import 'package:clothing_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late String _firstname;
  late String _lastName;
  late String _email;
  late int _phoneNumber;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  DateTime _currentDate = DateTime.now();
  dynamic _name;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffE7EAEF),
           appBar: AppBar(
             toolbarHeight:80 ,
             elevation: 0,
             automaticallyImplyLeading: false,
             backgroundColor: const Color(0xffE7EAEF),
             foregroundColor: const Color(0xffE7EAEF),
             title: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 13.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       IconButton(
                         onPressed: (){
                           Navigator.pop(context);
                         },
                         icon: SvgPicture.asset('assets/iconImages/Close.svg',
                           height: 30,
                           width: 30,
                         ),
                       ),
                       IconButton(
                           onPressed:(){
                             Navigator.push(context, MaterialPageRoute(builder: (context){
                               return TransactionsPage();
                             }));
                           },
                           icon: Image.asset('assets/iconImages/transaction.png')
                       )
                     ],
                   ),
                 ),
                 // const SizedBox(
                 //   height: 25,
                 // ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text('CART',
                       style: GoogleFonts.tenorSans(
                         fontSize: 20,
                         color: Colors.black
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
      body:context.watch<CartProvider>().getItems.isNotEmpty?SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<CartProvider>(
              builder: (context, cartProvider, child){

                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.6,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade400
                          )
                        )
                      ),
                      child: ListView.builder(
                        itemCount: cartProvider.count,
                          itemBuilder: (context, index){
                             _name = cartProvider.getItems[index].name;
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: 150,
                                  child: Image.network(cartProvider.getItems[index].imageUrl),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: SvgPicture.asset('assets/iconImages/lamerei.svg'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(cartProvider.getItems[index].name,
                                            style: GoogleFonts.tenorSans(
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30 ,
                                          ),
                                          Text(cartProvider.getItems[index].selectedIcon,
                                            style: GoogleFonts.tenorSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: cartProvider.getItems[index].quantity ==1? null
                                                  :(){
                                                cartProvider.decrement(cartProvider.getItems[index]);
                                              },
                                              icon: Icon(Icons.remove)),
                                          Text(cartProvider.getItems[index].quantity.toString()),
                                          IconButton(
                                              onPressed: cartProvider.getItems[index].quantity ==
                                                  30? null
                                                  :(){
                                                cartProvider.increment(cartProvider.getItems[index]);
                                              },
                                              icon: Icon(Icons.add)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13.0),
                                      child: Text('N${cartProvider.getItems[index].price.toStringAsFixed(2)}',
                                        style: GoogleFonts.tenorSans(
                                          fontSize: 14,
                                          color: Colors.orange
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                          }
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/iconImages/Sub Total.svg'),
                          Text(
                            //Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(2),  // you use this if there are no chaanges to be made in the context. you can use one or the other
                            //context.read<CartProvider>().totalPrice.toStringAsFixed(2),

                            //context.watch<CartProvider>().totalPrice.toStringAsFixed(2),
                            '\$${Provider.of<CartProvider>(context, listen: true).totalPrice.toStringAsFixed(2)}',   //you use this if changes can be made in the context (in this case, increment and decrement). you can use one or the other
                            style: GoogleFonts.tenorSans(
                                color: Colors.orange,
                                fontSize: 17
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/iconImages/shipcharge.svg')
                  ],
                );
              }
          ),
        ),
      ): Center(
        child: Text('You have no items in your Shopping Bag.',
          style: GoogleFonts.tenorSans(
              fontSize: 20
          ),
        ),
      ),
      bottomSheet:context.watch<CartProvider>().getItems.isEmpty?
      SvgPicture.asset('assets/iconImages/Button 1.svg',
        width: MediaQuery.of(context).size.width,
      ):
      GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (context){
                return Form(
                  key: _globalKey,
                  child: AlertDialog(
                    title: Center(
                      child: Text('Enter your info',
                      ),
                    ),
                    titleTextStyle: GoogleFonts.tenorSans(
                      color: Colors.orange,
                      fontSize: 20,

                  ),

                    content:  SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            validator: (v){
                              if(v!.isEmpty){
                                return 'First name must be filled';
                              }
                              return null;
                            },
                            onChanged: (v){
                              setState(() {
                                _firstname = v;
                              });
                            },
                            decoration: InputDecoration(
                             labelText: 'Enter First Name',

                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (v){
                              if(v!.isEmpty){
                                return 'Last name must be filled';
                              }
                              return null;
                            },
                            onChanged: (v){
                              setState(() {
                                _lastName = v;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter Last Name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (v){
                              if(v!.isEmpty){
                                return 'Email must be filled';
                              }
                              return null;
                            },
                            onChanged: (v){
                              setState(() {
                                _email = v;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter Email',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (v){
                              if(v!.isEmpty){
                                return 'Phone number must be filled';
                              }
                            },
                            onChanged: (v){
                              setState(() {
                                _phoneNumber = int.parse(v);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: (){
                         if(_globalKey.currentState!.validate()){
                           MakePayment(context, double.parse(Provider.of<CartProvider>(context, listen: false).totalPrice.toString()), _email, _firstname, _lastName, _phoneNumber, _currentDate, _name).chargeCardAndMakePayment();
                         }
                         Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text('Submit',
                              style: GoogleFonts.tenorSans(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                );
              }
          );
        },
        child: SvgPicture.asset('assets/iconImages/Butto.svg',
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

}
