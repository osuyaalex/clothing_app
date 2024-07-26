//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:share_plus/share_plus.dart';
//
// class DynamicLinkProvider{
//
//
//   createDynamicLink(String ref)async{
//     try{
//       final String url = 'https:///com.giepex.giepex?ref=$ref';
//       final DynamicLinkParameters parameters = DynamicLinkParameters(
//           link: Uri.parse(url),
//           androidParameters: const AndroidParameters(
//               packageName: 'com.osuyaalex.clothing_app',
//               minimumVersion: 23
//           ),
//           uriPrefix: 'https://giepx.page.link'
//       );
//       final FirebaseDynamicLinks link = await FirebaseDynamicLinks.instance;
//       final refLink = await link.buildShortLink(parameters);
//
//       return refLink.shortUrl.toString();
//     }catch(e){
//       print('the errrrrirrjtubegibgviehngunbregibjdglnhb ${e.toString()}');
//     }
//
//   }
//
//   //init dynamic link
//   initDynamicLink()async{
//     final  instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();
//     if(instanceLink != null){
//       final  Uri refLink = instanceLink.link;
//       Share.share('This is the link${refLink.queryParameters}');
//       print('Printttttttt ${refLink.data}');
//     }
//   }
//
//   Future handleDynamicLink()async{
//     final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
//
//     _handleDeepLink(data);
//
//     FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData dynamicLink) {
//       // Handle the dynamic link here
//       _handleDeepLink(dynamicLink);
//     }, onError: (e) async {
//       print('Failed to handle dynamic link: ${e.message}');
//     });
//   }
//   void _handleDeepLink(PendingDynamicLinkData? data){
//     final Uri deepLink = data!.link;
//     if(deepLink != null){
//       print('handledeeplink, deeplink $deepLink');
//     }
//   }
// }