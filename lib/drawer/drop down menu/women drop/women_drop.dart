import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/blouse.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/dress.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/kids.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/knitwear.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/outer.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/pants.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/skirt.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/apparel/tshirt.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/bag/hiking.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/bag/school.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/bag/work.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/new/dresses.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/new/shoes.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/new/tops.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/shoes/women_boots.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/shoes/women_heels.dart';
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/shoes/women_trainers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../network/model.dart';
import 'menu/accessories/beanies.dart';
import 'menu/accessories/belts.dart';
import 'menu/accessories/caps.dart';
import 'menu/apparel/denim.dart';
import 'menu/beauty/body_care.dart';
import 'menu/beauty/hair_care.dart';
import 'menu/beauty/make_up.dart';

class WomenDrop extends StatelessWidget {
  final AsyncSnapshot<Product> snapshot;
  const WomenDrop({Key? key, required this.snapshot}) : super(key: key);

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
                  content:Padding(
                    padding: const EdgeInsets.only(right: 250.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomenDresses();
                            }));
                          },
                          child: Text('Dresses',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomenTop();
                            }));
                          },
                          child: Text('Tops',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        //something new
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomenShoes();
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
                  header: Text('Apparel',
                style: GoogleFonts.tenorSans(
                fontSize: 20,
                color: Colors.black
                ),
                ),
                  content:  Padding(
                    padding: const EdgeInsets.only(right: 250.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelOuter();
                            }));
                          },
                          child: Text('Outer',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanAparelDress();
                            }));
                          },
                          child: Text('Dress',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelBlouse();
                            }));
                          },
                          child: Text('Blouse',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelTShirt();
                            }));
                          },
                          child: Text('T-Shirt',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelKnitWear();
                            }));
                          },
                          child: Text('KnitWear',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelSkirt();
                            }));
                          },
                          child: Text('Skirt',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelPants();
                            }));
                          },
                          child: Text('Pants',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelDenim();
                            }));
                          },
                          child: Text('Denim',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomanApparelKids();
                            }));
                          },
                          child: Text('Kids',
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
                              return const WomenShoesBoots();
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
                              return const WomenShoesHeels();
                            }));
                          },
                          child: Text('Heels',
                            style: GoogleFonts.tenorSans(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const WomenShoesTrainers();
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
                              return const WomenBagSchool();
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
                              return const WomenBagWork();
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
                              return const WomenBagHiking();
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
                              return const WomenAccessoriesBeanies();
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
                              return const WomenAccessoriesBelts();
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
                              return const WomenAccessoriesCaps();
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
                  header:Text('Beauty',
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
                              return const WomenBeautyBodyCare();
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
                              return const WomenBeautyHairCare();
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
                              return const WomenBeautyMakeUp();
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
