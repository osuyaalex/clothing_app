import 'package:accordion/accordion.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/clothing/jeans.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/clothing/joggers.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/clothing/shirts.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/new/men_clothing.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/new/men_shoes.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/new/men_tank_tops.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/shoes/men_shoes_boots.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/shoes/men_shoes_sandals.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/men%20drop/menu/shoes/men_shoes_trainers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menu/accessories/men_accessories_beanie.dart';
import 'menu/accessories/men_accessories_belts.dart';
import 'menu/accessories/men_accessories_caps.dart';
import 'menu/bag/men_bag_hiking.dart';
import 'menu/bag/men_bag_school.dart';
import 'menu/bag/men_bag_work.dart';
import 'menu/beauty/men_beauty_body_care.dart';
import 'menu/beauty/men_beauty_hair_care.dart';
import 'menu/beauty/men_beauty_make_up.dart';


class MenDrop extends StatefulWidget {
  const MenDrop({Key? key}) : super(key: key);

  @override
  State<MenDrop> createState() => _MenDropState();
}

class _MenDropState extends State<MenDrop> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Accordion(
            headerBackgroundColor: Color(0xfffafafb),
            contentBorderWidth: 20,
            headerPadding: const EdgeInsets.all(13),
            headerBackgroundColorOpened: Color(0xfffafafb),
            rightIcon: SvgPicture.asset('assets/iconImages/Forward.svg'),
            flipRightIconIfOpen: true,
            contentBackgroundColor:Color(0xfffafafb),
            contentBorderColor:Color(0xfffafafb) ,
            maxOpenSections: 1,
              children: [
                AccordionSection(
                  isOpen: false,
                    header:Text('New',
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.only(right: 250.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenClothing();
                              }));
                            },
                            child: Text('Clothing',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenShoes();
                              }));
                            },
                            child: Text('Shoes',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenTankTops();
                              }));
                            },
                            child: Text('TankTops',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                AccordionSection(
                  isOpen: false,
                    header: Text('Clothing',
                        style: GoogleFonts.tenorSans(
                        fontSize: 20,
                        color: Colors.black
                        ),
                        ),
                    content: Padding(
                      padding: const EdgeInsets.only(right: 250.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenClothingShirts();
                              }));
                            },
                            child: Text('Shirts',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenClothingJeans();
                              }));
                            },
                            child: Text('Jeans',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenClothingJoggers();
                              }));
                            },
                            child: Text('Joggers',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                AccordionSection(
                  isOpen: false,
                    header: Text('Shoes',
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                    content:Padding(
                      padding: const EdgeInsets.only(right: 250.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenShoesBoots();
                              }));
                            },
                            child: Text('Boots',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenShoesSandals();
                              }));
                            },
                            child: Text('Sandals',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenShoesTrainers();
                              }));
                            },
                            child: Text('Trainers',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                AccordionSection(
                  isOpen:false,
                    header:Text('Bag',
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.only(right: 250.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenBagSchool();
                              }));
                            },
                            child: Text('School',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenBagWork();
                              }));
                            },
                            child: Text('Work',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenBagHiking();
                              }));
                            },
                            child: Text('Hiking',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                AccordionSection(
                  isOpen: false,
                    header: Text('Accessories',
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                     content: Padding(
                       padding: const EdgeInsets.only(right: 250.0),
                       child: Column(
                         children: [
                           TextButton(
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return const MenAccessoriesBeanies();
                               }));
                             },
                             child: Text('Beanies',
                               style: GoogleFonts.tenorSans(
                                   fontSize: 20,
                                   color: Colors.black
                               ),
                             ),
                           ),
                           TextButton(
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return const MenAccessoriesBelts();
                               }));
                             },
                             child: Text('Belts',
                               style: GoogleFonts.tenorSans(
                                   fontSize: 20,
                                   color: Colors.black
                               ),
                             ),
                           ),
                           TextButton(
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return const MenAccessoriesCaps();
                               }));
                             },
                             child: Text('Caps',
                               style: GoogleFonts.tenorSans(
                                   fontSize: 20,
                                   color: Colors.black
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                ),
                AccordionSection(
                  isOpen: false,
                    header: Text('Beauty',
                      style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.only(right: 250.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenBeautyBodyCare();
                              }));
                            },
                            child: Text('Bod Care',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenBeautyHairCare();
                              }));
                            },
                            child: Text('Hair Care',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MenBeautyMakeUp();
                              }));
                            },
                            child: Text('Make Up',
                              style: GoogleFonts.tenorSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                )
              ]
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/iconImages/Call.svg'),
                const SizedBox(
                  width: 10,
                ),
                Text('07068808118',
                  style: GoogleFonts.tenorSans(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/iconImages/Location.svg'),
                const SizedBox(
                  width: 10,
                ),
                Text('Store Locator',
                  style: GoogleFonts.tenorSans(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset('assets/iconImages/Devider.svg'),
          const SizedBox(
            height: 35,
          ),
          SvgPicture.asset('assets/iconImages/Social.svg'),
        ],
      ),
    );
  }
}
