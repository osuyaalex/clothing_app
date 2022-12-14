import 'dart:convert';

import 'package:accordion/accordion.dart';
import 'package:clothing_app/provider/cart_provider.dart';
import 'package:clothing_app/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../controller/snackbar_controller.dart';
import '../../drawer/explore_collections_drawer.dart';
import '../../main_body/cart.dart';
import 'package:collection/collection.dart';

import 'caps_also_like.dart';

class CapsDrawerDetails extends StatefulWidget {
  final dynamic results;
  const CapsDrawerDetails({Key? key, required this.results}) : super(key: key);


  @override
  State<CapsDrawerDetails> createState() => _CapsDrawerDetailsState();
}

class _CapsDrawerDetailsState extends State<CapsDrawerDetails> {
  DateTime currentDate = DateTime.now();
  bool _small = true;
  bool _medium = true;
  bool _large = true;
  String _selectedIcon = 'n/s';
  loadCategoryJson () async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/model/category_products.json"); //for calling local json
    final jsonCategoryResult = jsonDecode(data);
    print(jsonCategoryResult);
    return jsonCategoryResult;
  }
  @override
  Widget build(BuildContext context) {
    DateTime futureDate = currentDate.add(Duration(days: 6));
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
              padding: const EdgeInsets.all(14.0),
              child: Stack(
                children: [
                  Image.network(widget.results['image'],),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset('assets/iconImages/Group 261.svg'),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:25.0, top: 12),
                child: Text(widget.results['name'],
                  style: GoogleFonts.tenorSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:25.0, top: 12),
                child: Text('\$${widget.results['price'].toString()}',
                  style: GoogleFonts.tenorSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.orange
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text('Size',
                    style: GoogleFonts.tenorSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_selectedIcon == 'n/s'){
                          _selectedIcon = 'S';
                        }else{
                          _selectedIcon = 'n/s';
                        }
                        _small = !_small;
                      });
                    },
                    child: _small ?Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey
                                ),
                                left: BorderSide(
                                    color: Colors.grey
                                ),
                                right: BorderSide(
                                    color: Colors.grey
                                ),
                                bottom: BorderSide(
                                    color: Colors.grey
                                )
                            )
                        ),
                        child: Center(
                          child: Text('S',
                            style: GoogleFonts.tenorSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ):Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey
                                ),
                                left: BorderSide(
                                    color: Colors.grey
                                ),
                                right: BorderSide(
                                    color: Colors.grey
                                ),
                                bottom: BorderSide(
                                    color: Colors.grey
                                )
                            )
                        ),
                        child: Center(
                          child: Text('S',
                            style: GoogleFonts.tenorSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_selectedIcon == 'n/s'){
                          _selectedIcon = 'M';
                        }else{
                          _selectedIcon = 'n/s';
                        }
                        _medium = !_medium;
                      });
                    },
                    child: _medium ?Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey
                                ),
                                left: BorderSide(
                                    color: Colors.grey
                                ),
                                right: BorderSide(
                                    color: Colors.grey
                                ),
                                bottom: BorderSide(
                                    color: Colors.grey
                                )
                            )
                        ),
                        child: Center(
                          child: Text('M',
                            style: GoogleFonts.tenorSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ):Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey
                                ),
                                left: BorderSide(
                                    color: Colors.grey
                                ),
                                right: BorderSide(
                                    color: Colors.grey
                                ),
                                bottom: BorderSide(
                                    color: Colors.grey
                                )
                            )
                        ),
                        child: Center(
                          child: Text('M',
                            style: GoogleFonts.tenorSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_selectedIcon == 'n/s'){
                          _selectedIcon = 'L';
                        }else{
                          _selectedIcon = 'n/s';
                        }
                        _large = !_large;
                      });
                    },
                    child: _large ?Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey
                                ),
                                left: BorderSide(
                                    color: Colors.grey
                                ),
                                right: BorderSide(
                                    color: Colors.grey
                                ),
                                bottom: BorderSide(
                                    color: Colors.grey
                                )
                            )
                        ),
                        child: Center(
                          child: Text('L',
                            style: GoogleFonts.tenorSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ):Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey
                                ),
                                left: BorderSide(
                                    color: Colors.grey
                                ),
                                right: BorderSide(
                                    color: Colors.grey
                                ),
                                bottom: BorderSide(
                                    color: Colors.grey
                                )
                            )
                        ),
                        child: Center(
                          child: Text('L',
                            style: GoogleFonts.tenorSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Provider.of<CartProvider>(context, listen: false).getItems.firstWhereOrNull((element) => element.name == widget.results['name']) != null? snackBar('item already added', context)
                    :Provider.of<CartProvider>(context, listen: false).addItem(
                    widget.results['name'],
                    widget.results['image'],
                    1,
                    widget.results['price'],
                    _selectedIcon
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.add, color: Colors.white,),
                              ),
                              Text('ADD TO BASKET',
                                style: GoogleFonts.tenorSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 27),
                      child: Icon(Icons.favorite_border, color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('DESCRIPTION'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(widget.results['description'],
                style: GoogleFonts.tenorSans(
                    fontSize: 15,
                    height: 1.5
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Size and fit'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(widget.results['size and fit'],
                  style: GoogleFonts.tenorSans(
                      fontSize: 15,
                      height: 1.5
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('material and care'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(widget.results['Materials and care'],
                  style: GoogleFonts.tenorSans(
                      fontSize: 15,
                      height: 1.5
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('care'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Accordion(
                headerBackgroundColor: Color(0xfffafafb),
                headerBackgroundColorOpened: Color(0xfffafafb),
                contentBorderColor:Color(0xfffafafb),
                contentBackgroundColor:Color(0xfffafafb),
                rightIcon: SvgPicture.asset('assets/iconImages/Forward.svg'),
                flipRightIconIfOpen: true,
                headerPadding: const EdgeInsets.all(13),
                contentBorderWidth: 20,
                maxOpenSections: 1,
                children: [
                  AccordionSection(
                      isOpen: false,
                      header:Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SvgPicture.asset('assets/iconImages/Shipping.svg'),
                          ),
                          SvgPicture.asset('assets/iconImages/Free Flat Rate Shipping.svg')
                        ],
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Estimated to be delivered on',
                                style: GoogleFonts.tenorSans(
                                    color: Colors.grey.shade700,
                                    fontSize: 15,
                                    height: 1.5
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:60.0, top: 8),
                            child: Text("${DateFormat('MM/dd/yyyy').format(currentDate)} - ${DateFormat('MM/dd/yyyy').format(futureDate)}",
                              style: GoogleFonts.tenorSans(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  height: 1.5
                              ),
                            ),
                          ),

                        ],
                      )
                  )
                ]
            ),
            SvgPicture.asset('assets/iconImages/youmay.svg'),
            FutureBuilder(
                future: loadCategoryJson(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return CapsAlsoLike(snapshot: snapshot);
                  }else{
                    return CircularProgressIndicator(color: Colors.black,);
                  }
                }
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SvgPicture.asset('assets/iconImages/Twitter.svg'),
                ),
                SvgPicture.asset('assets/iconImages/Instagram.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SvgPicture.asset('assets/iconImages/YouTube.svg'),
                ),
              ],

            ),
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset('assets/iconImages/8.svg'),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('support@openui design',
                style: GoogleFonts.tenorSans(
                    fontSize: 17
                ),
              ),
            ),
            Text('+60 825 876',
              style: GoogleFonts.tenorSans(
                  fontSize: 17
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('08:00 - 22:00 - Everyday',
                style: GoogleFonts.tenorSans(
                    fontSize: 17
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            SvgPicture.asset('assets/iconImages/8.svg'),
          ],
        ),
      ),
    );
  }
}
