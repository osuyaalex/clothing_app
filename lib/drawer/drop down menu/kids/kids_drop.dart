import 'package:accordion/accordion.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/kids/menu/bag/kids_bag_events.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/kids/menu/bag/kids_bag_sports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menu/accessories/Kids_accessories_caps.dart';
import 'menu/accessories/kids_accessories_beanies.dart';
import 'menu/accessories/kids_accessories_belts.dart';
import 'menu/bag/kids_bag_school.dart';
import 'menu/beauty/kids_beauty_body_care.dart';
import 'menu/beauty/kids_beauty_hair_care.dart';
import 'menu/beauty/kids_beauty_makeup.dart';
import 'menu/clothing/kids_clothing_jeans.dart';
import 'menu/clothing/kids_clothing_joggers.dart';
import 'menu/clothing/kids_clothing_shirts.dart';
import 'menu/new/kids_clothing.dart';
import 'menu/new/kids_shoes.dart';
import 'menu/shoes/kids_shoes_boots.dart';
import 'menu/shoes/kids_shoes_sandals.dart';
import 'menu/shoes/kids_shoes_trainers.dart';


class KidsDrop extends StatefulWidget {
  const KidsDrop({Key? key}) : super(key: key);

  @override
  State<KidsDrop> createState() => _KidsDropState();
}

class _KidsDropState extends State<KidsDrop> {
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
                              return const KidsClothing();
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
                              return const KidsShoes();
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
                              return const KidsShoes();
                            }));
                          },
                          child: Text('Shoes',
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
                              return const KidsClothingShirts();
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
                              return const KidsClothingJeans();
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
                              return const KidsClothingJoggers();
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
                              return const KidsShoesBoots();
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
                              return const KidsShoesSandals();
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
                              return const KidsShoesTrainers();
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
                  content:Padding(
                    padding: const EdgeInsets.only(right: 250.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const KidsBagSchool();
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
                              return const KidsBagEvents();
                            }));
                          },
                          child: Text('Events',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const KidsBagSports();
                            }));
                          },
                          child: Text('Sports',
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
                              return const KidsAccessoriesBeanies();
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
                              return const KidsAccessoriesBelts();
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
                              return const KidsAccessoriesCaps();
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
                              return const KidsBeautyBodyCare();
                            }));
                          },
                          child: Text('Body Care',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const KidsBeautyHairCare();
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
                              return const KidsBeautyMakeUp();
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
