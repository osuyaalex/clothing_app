import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Center(
        child: Text('You have no items in your Shopping Bag.',
          style: GoogleFonts.tenorSans(
            fontSize: 20
          ),
        ),
      ),
      bottomSheet: SvgPicture.asset('assets/iconImages/Button 1.svg',
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
