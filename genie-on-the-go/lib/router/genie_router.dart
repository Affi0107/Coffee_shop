// import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
// import 'package:project_2/cart/cart_screen/cart.dart';
// import 'package:project_2/login_register/login.dart';
// import 'package:project_2/myhomepage/pages/handcraft/cookies/cookies_page.dart';
// import 'package:project_2/myhomepage/pages/handcraft/drinks/drinks_page.dart';
// import 'package:project_2/myhomepage/pages/handcraft/snacks/snacks_page.dart';

// import '../payments/payment_app.dart';
// import '../splashscreen/splash_screen.dart';

// class Routes {
//   static final router = FluroRouter();

//   static var firstScreen = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return SplashScreen();
//   });

//   static var placeHandler = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return const Login();
//   });

//   static var placeHandler1 = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return Cart();
//   });

//   static var placeHandler2 = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return const PaymentApp();
//   });

//   static var placeHandler3 = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return DrinksPage();
//   });

//   static var placeHandler4 = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return const CookiesPage();
//   });

//   static var placeHandler5 = Handler(
//       handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return const SnacksPage();
//   });

//   static dynamic defineRoutes() {
//     router.define("SplashScreen",
//         handler: firstScreen, transitionType: TransitionType.fadeIn);
//     router.define("LoginScreen",
//         handler: placeHandler, transitionType: TransitionType.inFromLeft);
//     router.define("Cart",
//         handler: placeHandler1, transitionType: TransitionType.inFromRight);
//     router.define("PaymentApp",
//         handler: placeHandler2, transitionType: TransitionType.inFromTop);

//     router.define("DrinksPage",
//         handler: placeHandler3, transitionType: TransitionType.inFromRight);
//     router.define("CookiesPage",
//         handler: placeHandler4, transitionType: TransitionType.inFromTop);
//     router.define("SnacksPage",
//         handler: placeHandler5, transitionType: TransitionType.inFromTop);
//   }
// }
