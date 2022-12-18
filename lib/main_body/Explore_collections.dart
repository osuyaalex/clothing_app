
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothing_app/minor%20screen/circle_tab_indicator.dart';
import 'package:clothing_app/sub_screens/carousel.dart';
import 'package:clothing_app/sub_screens/video.dart';
import 'package:clothing_app/tabs/all.dart';
import 'package:clothing_app/tabs/bag.dart';
import 'package:clothing_app/tabs/dress.dart';
import 'package:clothing_app/tabs/tshirt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:convert';
import '../tabs/apparel.dart';
import 'black content/black _screen.dart';


class ExploreCollections extends StatefulWidget {
  const ExploreCollections({Key? key}) : super(key: key);

  @override
  State<ExploreCollections> createState() => _ExploreCollectionsState();
}

class _ExploreCollectionsState extends State<ExploreCollections> {
  late YoutubePlayerController _controller;
  final videoUrl = 'https://youtu.be/cDxv-y1XuaA';
  

  loadJson () async {
  String data = await DefaultAssetBundle.of(context).loadString("assets/model/clothes.json"); //for calling local json
  final jsonResult = jsonDecode(data);

  return jsonResult;
  }

  @override
  void initState() {
    super.initState();
     loadJson();
   final videoId = YoutubePlayer.convertUrlToId(videoUrl);
   _controller = YoutubePlayerController(
       initialVideoId: videoId!,
     flags: const YoutubePlayerFlags(
       autoPlay: false,
       hideThumbnail: true,
       loop: false,
       mute: true,
       showLiveFullscreenButton: false
     )
   );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  int _activeIndex = 0;
  final List<Widget> _images = [
    Stack(
      children: [
        Image.asset('assets/images/image 10.png', width: double.infinity, fit: BoxFit.cover,),
        Padding(
          padding: const EdgeInsets.only(left: 55.0, top: 230),
          child: Text(
            'Luxury \n   Fashion \n &Accessories'.toUpperCase(),
            style: TextStyle(
                fontFamily: 'Bodoni',
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 400.0),
          child: Center(
            child:SvgPicture.asset('assets/iconImages/Button.svg'),
          ),
        ),
      ],
    ),
    Image.asset('assets/images/leeloo.jpeg', width: double.infinity, fit: BoxFit.cover,),
    Image.asset('assets/images/ayaka.jpeg', width: double.infinity,fit: BoxFit.cover,),
  ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
              length: 5,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            aspectRatio: 16/9,
                            height: MediaQuery.of(context).size.height*0.78,
                            autoPlay: false,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason){
                              setState(() {
                                _activeIndex = index;
                              });
                            }
                        ),
                        itemCount: _images.length,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamedAndRemoveUntil(BlackScreen.routeName, (route) => false);
                              },
                              child: _images[index],
                          );
                        },
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                            child: buildIndicator()
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/images/Title.svg'),

                  FutureBuilder(
                    future: loadJson(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                            children: [
                              TabBar(
                                  indicator: CircleTabIndicator(
                                      color: Colors.redAccent, radius: 3),
                                  tabs: [
                                    Tab(child: Text('All', style: TextStyle(
                                        color: Colors.grey.shade600),),),
                                    Tab(child: Text('Apparel', style: TextStyle(
                                        color: Colors.grey.shade600),),),
                                    Tab(child: Text('Dress', style: TextStyle(
                                        color: Colors.grey.shade600),),),
                                    Tab(child: Text('Tshirt', style: TextStyle(
                                        color: Colors.grey.shade600),),),
                                    Tab(child: Text('Bag', style: TextStyle(
                                        color: Colors.grey.shade600),),),
                                  ]
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 700,
                                child: TabBarView(
                                    children: [
                                      All(items: snapshot.data),
                                      Apparel(items: snapshot.data,),
                                      Dress(items: snapshot.data),
                                      Tshirt(items: snapshot.data),
                                      Bag(items: snapshot.data),
                                    ]
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Explore More',
                                    style: GoogleFonts.tenorSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 21
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){},
                                      icon: const Icon(Icons.arrow_forward,
                                        size: 21,
                                      )
                                  )
                                ],
                              )
                            ]
                        );
                      }else{
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },

                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SvgPicture.asset('assets/iconImages/Devider.svg'),
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/logo/Prada.svg'),
                          SvgPicture.asset('assets/logo/Burberry.svg'),
                          SvgPicture.asset('assets/logo/Boss.svg'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/logo/Catier.svg'),
                          SvgPicture.asset('assets/logo/Gucci.svg'),
                          SvgPicture.asset('assets/logo/Tiffany & Co.svg'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SvgPicture.asset('assets/iconImages/Devider.svg'),
                  const SizedBox(
                    height: 80,
                  ),
                  SvgPicture.asset('assets/iconImages/Collections.svg'),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Stack(
                        children: [
                          Image.asset('assets/images/image 12.png'),
                          Positioned.fill(
                              child: Align(
                                alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12.0, top: 55),
                                    child: SvgPicture.asset('assets/iconImages/10.svg'),
                                  )
                              )
                          ),
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12.0, top: 35),
                                    child: SvgPicture.asset('assets/iconImages/October.svg'),
                                  )
                              )
                          ),
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0, top: 90),
                                    child: SvgPicture.asset('assets/iconImages/Collection.svg'),
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/images/image 9.jpeg'),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 24.0, bottom: 165),
                                child: SvgPicture.asset('assets/iconImages/Autumn.svg'),
                              )
                          )
                      ),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30.0, bottom: 110),
                                child: SvgPicture.asset('assets/iconImages/Collection (1).svg'),
                              )
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Video(controller: _controller),
                  const SizedBox(
                    height: 90,
                  ),

                  SvgPicture.asset('assets/iconImages/Just for You.svg'),
                  SvgPicture.asset('assets/iconImages/Devider.svg'),
                 const SizedBox(
                   height: 30,
                 ),
                 FutureBuilder(
                   future: loadJson(),
                     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                       if(snapshot.connectionState == ConnectionState.waiting) {
                         return const Center(child: CircularProgressIndicator(),);
                       } else if (snapshot.connectionState == ConnectionState.done){
                         return SizedBox(
                           height: 430,
                             child: Carousel(items: snapshot.data,));
                       }else{
                         return const Center(
                           child: CircularProgressIndicator(
                             color: Colors.black,
                           ),
                         );
                       }
                       }
                       ),

                  SvgPicture.asset('assets/iconImages/Indicator.svg'),
                  const SizedBox(
                    height: 100,
                  ),
                  SvgPicture.asset('assets/iconImages/Trending.svg',),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Color(0xffEBEEF2),
                      border: Border(
                        top: BorderSide(
                          color: Colors.black
                        ),
                        left: BorderSide(
                            color: Colors.black
                        ),
                        right: BorderSide(
                            color: Colors.black
                        ),
                        bottom: BorderSide(
                            color: Colors.black
                        ),
                      )
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        SvgPicture.asset('assets/iconImages/LogoCont.svg'),
                        const SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset('assets/iconImages/Sentence.svg'),
                        const SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset('assets/iconImages/5.svg'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/iconImages/M Sticker.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                SvgPicture.asset('assets/iconImages/smalls.svg'),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset('assets/iconImages/Mi Sticker.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                SvgPicture.asset('assets/iconImages/smallss.svg'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/iconImages/Mir Sticker.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                SvgPicture.asset('assets/iconImages/smallsss.svg'),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset('assets/iconImages/Miro Sticker.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                SvgPicture.asset('assets/iconImages/smallssss.svg'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        SvgPicture.asset('assets/iconImages/curve.svg'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset('assets/iconImages/Follow Us (1).svg'),
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset('assets/iconImages/Instagram.svg'),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/iconImages/Group 257.png'),

                        Image.asset('assets/iconImages/Group 258.png'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/iconImages/Group 259.png'),

                        Image.asset('assets/iconImages/Group 260.png'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SvgPicture.asset('assets/iconImages/Foot.svg'),
                ],
              ),
            );
          }

  Widget buildIndicator(){
    return AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: _images.length,
        effect: const JumpingDotEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Colors.white
        ),
    );
  }
}
