import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../drawer/explore_collections_drawer.dart';
import '../../../title.dart';
import '../../cart.dart';
import '../black/black_collection.dart';
import '../hae/hae_collection.dart';
import 'october_grid.dart';

class OctoberCollections extends StatefulWidget {
  const OctoberCollections({Key? key}) : super(key: key);

  @override
  State<OctoberCollections> createState() => _OctoberCollectionsState();
}

class _OctoberCollectionsState extends State<OctoberCollections> {
  loadCategoryJson () async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/model/category_products.json"); //for calling local json
    final jsonCategoryResult = jsonDecode(data);
    print(jsonCategoryResult);
    return jsonCategoryResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(343434),
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

            FutureBuilder(
              future: loadCategoryJson(),
                builder: (context, snapshot){
                if(snapshot.hasData){
                  return OctoberGrid(snapshot: snapshot);
                }else{
                  return CircularProgressIndicator(color: Colors.black,);
                }
                }
            ),
            SvgPicture.asset('assets/iconImages/Titile.svg'),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return BlackCollections();
                              }));
                            },
                            child: Image.asset('assets/images/image 21.png')
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, right: 105),
                          child: Align(
                            alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                  'assets/iconImages/Black collection.svg',
                                height: 15,
                              )
                          ),
                        )
                        ,
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return HaeCollections();
                              }));
                            },
                            child: Image.asset('assets/images/image 22.png')
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, right: 105),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                'assets/iconImages/HAE BY HAEKIM.svg',
                                height: 15,
                              )
                          ),
                        )
                        ,
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height:80 ,
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
