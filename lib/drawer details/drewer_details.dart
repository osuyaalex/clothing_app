import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../drawer/explore_collections_drawer.dart';
import '../main_body/cart.dart';

class DrawerDetails extends StatelessWidget {
 final dynamic results;
  const DrawerDetails({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Stack(
                children: [
                  Image.network(results['image'],),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset('assets/iconImages/Group 261.svg'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(results['name'],
                style: GoogleFonts.tenorSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
