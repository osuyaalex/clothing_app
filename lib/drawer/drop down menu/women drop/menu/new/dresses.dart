import 'package:clothing_app/drawer/explore_collections_drawer.dart';
import 'package:flutter/material.dart';
class WomenDresses extends StatelessWidget {
  static const String routeName= 'WomenDresses';

  const WomenDresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamedAndRemoveUntil(ExploreCollectionsDrawer.routeName, (route) => false);
        },
        child: const Center(
          child: Text('back'),
        ),
      )
    );
  }
}
