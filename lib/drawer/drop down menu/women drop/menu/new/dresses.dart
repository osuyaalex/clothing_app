import 'package:clothing_app/drawer%20details/dresser%20drawer%20details/drewer_details.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/new/shoes.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/new/tops.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../../../main_body/cart.dart';
import '../../../../../title.dart';
import '../../../../explore_collections_drawer.dart';
import '../../women list/women_list.dart';


class WomenDresses extends StatefulWidget {
  final List product;
  static const String routeName= 'WomenDresses';

  const WomenDresses({Key? key, required this.product}) : super(key: key);

  @override
  State<WomenDresses> createState() => _WomenDressesState();
}

class _WomenDressesState extends State<WomenDresses> {
  bool listChange = true;
   String _newItem = 'Dresses';
  @override
  Widget build(BuildContext context) {
    var results = widget.product.where((element) => element['type'] =='dresses').toList();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(PageTransition(
                      child: const ExploreCollectionsDrawer(),
                      type: PageTransitionType.leftToRight,
                      childCurrent: widget,
                      duration: const Duration(milliseconds: 300),
                      reverseDuration: const Duration(milliseconds: 300),
                    )
                    );
                  },
                  child: SvgPicture.asset('assets/iconImages/Menu.svg')),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return TitleHome();
                      }));
                    },
                    child: SvgPicture.asset('assets/iconImages/Logo.svg')),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/iconImages/Search.svg'),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Cart();
                        }));
                      },
                      child: SvgPicture.asset('assets/iconImages/shopping bag.svg')
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text(results.length.toString(),
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('Dresses',
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                              iconOnClick: SvgPicture.asset('assets/iconImages/Back.svg'),
                              //dropdownOverButton: true,
                            buttonPadding: EdgeInsets.symmetric(horizontal: 13),
                            buttonDecoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)
                            ),
                              alignment: AlignmentDirectional.topStart,
                              dropdownElevation: 0,
                              isDense: true,
                              style: GoogleFonts.tenorSans(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                              //menuMaxHeight: MediaQuery.of(context).size.height,
                              isExpanded: true,
                              value: _newItem,
                              icon: SvgPicture.asset('assets/iconImages/Forward.svg'),
                              items: nnew.map<DropdownMenuItem>((value){
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),

                                );
                              }).toList() ,
                              onChanged: (newValue){

                                if(newValue != _newItem){
                                  switch(newValue){
                                    case 'Tops': Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return  WomenTop(products: widget.product,);
                                    }));
                                    break;
                                    case 'Shoes': Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return  WomenShoes(prods: widget.product,);
                                    }));
                                  }
                                }
                                setState(() {
                                  _newItem = newValue;
                                });
                              }
                          ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          listChange = !listChange;
                        });
                      },
                      child: listChange ?Container(
                       padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15)
                        ),
                          child: SvgPicture.asset('assets/iconImages/Listview.svg')
                      ):Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: SvgPicture.asset('assets/iconImages/grid view.svg')
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: SvgPicture.asset('assets/iconImages/Filter.svg')
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade400
                        ),
                        bottom: BorderSide(
                            color: Colors.grey.shade400
                        ),
                        left: BorderSide(
                            color: Colors.grey.shade400
                        ),
                        right: BorderSide(
                            color: Colors.grey.shade400
                        ),
                      ),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Women',
                          style: GoogleFonts.tenorSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.close)
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          bottom: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          left: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          right: BorderSide(
                              color: Colors.grey.shade400
                          ),
                        ),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dresses',
                          style: GoogleFonts.tenorSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.close)
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    Padding(
         padding: const EdgeInsets.all(10.0),
            child: listChange ?StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            itemCount: results.length,
            itemBuilder: (BuildContext ctx, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DrawerDetails(results: results[index]);
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
              image: NetworkImage(results[index]['image'])
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
                child: Text(results[index]['name'],
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
                child: Text('\$${results[index]['price'].toString()}',
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
            ): ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: results.length,
                itemBuilder: (context, index){
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DrawerDetails(results: results[index]);
                          }));
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(results[index]['image'])
                              )
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/iconImages/lamerei.svg'),
                        const SizedBox(
                          height: 7,
                        ),

                          Text(results[index]['name'],
                            style: GoogleFonts.tenorSans(
                              color: Colors.grey.shade600,
                              fontSize: 18
                            ),
                          ),

                        const SizedBox(
                          height: 7,
                        ),
                        Text('\$${results[index]['price'].toString()}',
                          style: GoogleFonts.tenorSans(
                              color: Colors.orange,
                              fontSize: 18
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                              color: Colors.orange,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('${results[index]['rating'].toString()}',
                                style: GoogleFonts.tenorSans(
                                    fontSize: 18
                                ),
                              ),
                            ),
                            Text('Ratings',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text('Size'.toUpperCase(),
                              style: GoogleFonts.tenorSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                           Padding(
                             padding: const EdgeInsets.all(3.0),
                             child: SvgPicture.asset('assets/iconImages/Group 199.svg',
                                    height: 30,
                                  ),
                           ),


                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SvgPicture.asset('assets/iconImages/M.svg',
                                  height: 30,
                                ),
                              ),

                           Padding(
                             padding: const EdgeInsets.all(3.0),
                             child: SvgPicture.asset('assets/iconImages/L.svg',
                                  height: 30,
                                ),
                           ),
                            const SizedBox(
                              width: 35,
                            ),
                            Icon(Icons.favorite_border,
                              color: Colors.orange,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                );
                }
            ),
            )
                  ],
                ),
      )
            );

          }
        }
