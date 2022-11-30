import 'dart:convert';

import 'package:clothing_app/drawer/drop%20down%20menu/kids/kids_drop.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/men_drop.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/women_drop.dart';
import 'package:clothing_app/network/network.dart';
import 'package:clothing_app/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../network/model.dart';



class ExploreCollectionsDrawer extends StatefulWidget {
  static const String routeName= 'ExploreCollectionsDrawer';
  const ExploreCollectionsDrawer({Key? key}) : super(key: key);

  @override
  State<ExploreCollectionsDrawer> createState() => _ExploreCollectionsDrawerState();
}

class _ExploreCollectionsDrawerState extends State<ExploreCollectionsDrawer> {
  late Future<Product> newProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newProducts = Network().fetchProduct();

    newProducts.then((product) {
      print(product.navigation![1].alias);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15),
              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).push(PageTransition(
                      child: const TitleHome(),
                      type: PageTransitionType.rightToLeft,
                      childCurrent: widget,
                      duration: const Duration(milliseconds: 300),
                      reverseDuration: const Duration(milliseconds: 300),
                    ));
                  },
                  icon: SvgPicture.asset('assets/iconImages/Close.svg',
                  height: 30,
                    width: 30,
                  )
              ),
            ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: newProducts,
                  builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorPadding: EdgeInsets.only(top: 35),
                            indicator: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/iconImages/Rectangle.png')
                                )
                            ),
                            tabs: [
                              Tab(child: Text('WOMEN', style: GoogleFonts.tenorSans(
                                  fontSize: 20
                              ),)),
                              Tab(child: Text('MEN', style: GoogleFonts.tenorSans(
                                  fontSize: 20
                              ),)),
                              Tab(child: Text('KIDS', style: GoogleFonts.tenorSans(
                                  fontSize: 20
                              ),)),
                            ]
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                         SizedBox(
                          height: 659,
                          child: TabBarView(children:[
                            WomenDrop(snapshot: snapshot,),
                            MenDrop(),
                            KidsDrop(),
                          ]),
                        )
                      ],
                    );
                  }else{
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                      ),
                    );
                  }
                  }
              )

          ],
        ),
      ),
    );
  }
}
