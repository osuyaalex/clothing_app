import 'package:clothing_app/drawer/explore_collections_drawer.dart';
import 'package:clothing_app/main_body/Explore_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import 'linking.dart';
import 'main_body/cart.dart';

class TitleHome extends StatelessWidget {
  static const String routeName= 'TitleHome';
  const TitleHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE7EAEF),
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
                    childCurrent: this,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                  )
                  );
                },
                  child: SvgPicture.asset('assets/iconImages/Menu.svg')),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: SvgPicture.asset('assets/iconImages/Logo.svg'),
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
      body: const SingleChildScrollView(child: ExploreCollections()),
    );
  }
}
