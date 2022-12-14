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
                   padding: const EdgeInsets.only(right: 30.0),
                   child: IconButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     icon: SvgPicture.asset('assets/iconImages/Close.svg',
                       height: 30,
                       width: 30,
                     ),
                   ),
                 ),
                 // const SizedBox(
                 //   height: 25,
                 // ),
                 Text('CART',
                   style: GoogleFonts.tenorSans(
                     fontSize: 20,
                     color: Colors.black
                   ),
                 ),
               ],
             ),
           ),
      body:context.watch<CartProvider>().getItems.isNotEmpty?Padding(
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
                                    child: Text('\$${cartProvider.getItems[index].price.toStringAsFixed(2)}',
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
      ):SvgPicture.asset('assets/iconImages/Butto.svg',
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
