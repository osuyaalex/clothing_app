import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatefulWidget {
 final  List items;
  const Carousel({Key? key, required this.items}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  @override
  Widget build(BuildContext context) {
    var result = widget.items.where((element) => element["isActive"] ==true).toList();
     return ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: result.length,
         itemBuilder: (context, index){
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Container(
                 height: 350,
                 width: 250,
                 decoration: BoxDecoration(
                     image: DecorationImage(
                       fit: BoxFit.fill,
                       image: NetworkImage(result[index]['image']),
                     )
                 ),
               ),
               Center(
                 child: Text(result[index]['name'],
                     style: GoogleFonts.tenorSans(
                         fontWeight: FontWeight.w500,
                         fontSize: 15
                     )

                 ),
               ),
               Text(result[index]['type'],
                 style: GoogleFonts.tenorSans(
                     fontWeight: FontWeight.w500,
                     fontSize: 15
                 ),
               ),
               const SizedBox(
                 height: 5,
               ),
               Text(' ${result[index]['price']}',
                 style: GoogleFonts.tenorSans(
                     fontWeight: FontWeight.w500,
                     fontSize: 17,
                     color: Colors.orange
                 ),
               )
             ],
           ),
         );
         }
     );
  }
}
