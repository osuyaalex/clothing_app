
import 'package:clothing_app/drawer/drop%20down%20menu/women%20drop/menu/new/dresses.dart';
import 'package:clothing_app/drawer/explore_collections_drawer.dart';
import 'package:clothing_app/main_body/black%20_screen.dart';
import 'package:clothing_app/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:TitleHome.routeName,
      routes: {
        TitleHome.routeName:(context)=>const TitleHome(),
        BlackScreen.routeName:(context)=>const BlackScreen(),
        ExploreCollectionsDrawer.routeName:(context)=> const ExploreCollectionsDrawer(),
      },
    );
  }
}
