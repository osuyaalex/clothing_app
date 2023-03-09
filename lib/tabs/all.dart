import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class All extends StatefulWidget {
  final List items;
  const All({Key? key, required this.items}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {

  @override
  void initState() {
    widget.items.shuffle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        physics:const NeverScrollableScrollPhysics() ,
        itemCount: 4,
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

                        image: NetworkImage(widget.items[index]['image'])
                    )
                  ),
                ),

                Center(
                  child: Text(widget.items[index]['name'],
                    style: GoogleFonts.tenorSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                    )

                  ),
                ),
                Text(widget.items[index]['type'],
                  style: GoogleFonts.tenorSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(' ${widget.items[index]['price']}',
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
