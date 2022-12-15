import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'makeup_dd.dart';

class MakeUpAlsoLike extends StatefulWidget {
  final AsyncSnapshot snapshot;
  const MakeUpAlsoLike({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<MakeUpAlsoLike> createState() => _MakeUpAlsoLikeState();
}

class _MakeUpAlsoLikeState extends State<MakeUpAlsoLike> {
  @override
  Widget build(BuildContext context) {
    List products = widget.snapshot.data;
    List product = products.where((element) => element['type'] =='make up').toList();
    product.shuffle();
    return StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        itemCount: 4,
        itemBuilder: (BuildContext ctx, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MakeUpDrawerDetails(results: product[index]);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product[index]['image'])
                        )
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('WM',
                      style: GoogleFonts.tenorSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 7,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(product[index]['name'],
                      style: GoogleFonts.tenorSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey.shade600
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('\$${product[index]['price'].toString()}',
                      style: GoogleFonts.tenorSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.orange
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        staggeredTileBuilder: (context) => const StaggeredTile.fit(1)
    );
  }
}
