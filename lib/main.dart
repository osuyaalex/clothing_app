
import 'package:clothing_app/drawer/explore_collections_drawer.dart';
import 'package:clothing_app/main_body/black%20content/black%20_screen.dart';
import 'package:clothing_app/provider/cart_provider.dart';
import 'package:clothing_app/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'linking.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // Get any initial links
 // DynamicLinkProvider().initDynamicLink();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return CartProvider();
        })
      ],
      child: const MyApp()));
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
