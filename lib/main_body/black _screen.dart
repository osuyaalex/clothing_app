import 'package:clothing_app/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../drawer/explore_collections_drawer.dart';
import 'cart.dart';

class BlackScreen extends StatelessWidget {
  static const String routeName = 'BlackScreen';
  const BlackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(343434),
      appBar: AppBar(
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
                  child: SvgPicture.asset('assets/iconImages/Menu1.svg')
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(TitleHome.routeName, (route) => false);
                  },
                    child: SvgPicture.asset('assets/iconImages/Logo1.svg')
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/iconImages/Search1.svg'),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Cart();
                        }));
                      },
                      child: SvgPicture.asset('assets/iconImages/shopping bag1.svg')
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
            Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.center,
                      child: SvgPicture.asset('assets/iconImages/10.svg')
                  ),
                ),
                Positioned(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 30),
                        child: SvgPicture.asset('assets/iconImages/October.svg'),
                      )
                  ),
                ),
                Positioned(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80.0, left: 30),
                        child: SvgPicture.asset('assets/iconImages/Collection.svg'),
                      )
                  ),
                ),
                Positioned(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top:100.0),
                        child: Image.asset('assets/images/image 20.jpeg'),
                      )
                  ),
                ),
                Positioned(
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 360.0,left:120),
                        child: SvgPicture.asset('assets/iconImages/11.svg'),
                      )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/iconImages/01.svg'),
                  SvgPicture.asset('assets/iconImages/Line 23.svg'),
                  SvgPicture.asset('assets/iconImages/October collection.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset('assets/images/image 21.png'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/iconImages/02.svg'),
                  SvgPicture.asset('assets/iconImages/Line 23.svg'),
                  SvgPicture.asset('assets/iconImages/Black collection.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/image 22.png'),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/iconImages/03.svg'),
                  SvgPicture.asset('assets/iconImages/Line 23.svg'),
                  SvgPicture.asset('assets/iconImages/HAE BY HAEKIM.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            SvgPicture.asset('assets/iconImages/Footer.svg',
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
