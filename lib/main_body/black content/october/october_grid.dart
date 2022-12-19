import 'package:clothing_app/main_body/black%20content/october/october_drawer_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class OctoberGrid extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const OctoberGrid({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productList = snapshot.data;
    var product = productList.where((element) => element['type'] == 'halloween').toList();
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),

        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OctoberDrawerDetails(results: product[index]);
                    }));
                  },
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product[index]['image']),
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('October collection',
                      style: GoogleFonts.tenorSans(
                        color: Colors.white,
                        fontSize: 15.5
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(product[index]['name'],
                      style: GoogleFonts.tenorSans(
                          color: Colors.grey.shade600,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        '\$${product[index]['price']}',
                      style: GoogleFonts.tenorSans(
                          color: Colors.orange.shade400,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      staggeredTileBuilder: (context) => const StaggeredTile.fit(1)
      ),
    );
  }
}
