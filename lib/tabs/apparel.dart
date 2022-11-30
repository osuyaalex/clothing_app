import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Apparel extends StatefulWidget {
  List items;
   Apparel({Key? key, required this.items}) : super(key: key);

  @override
  State<Apparel> createState() => _ApparelState();
}

class _ApparelState extends State<Apparel> {

  @override
  Widget build(BuildContext context) {
    var result = widget.items.where((element) => element["type"] =="apparel").toList();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          physics:const NeverScrollableScrollPhysics() ,
          itemCount: result.length,

          itemBuilder: (BuildContext ctx, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,

                            image: NetworkImage(result[index]['image'])
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
          },
          staggeredTileBuilder: (context) => const StaggeredTile.fit(1)
      ),
    );
  }
}
