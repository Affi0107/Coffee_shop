// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_2/Cargo/men/men_shoes.dart';
import 'package:project_2/Cargo/men/men_shoes_details_page.dart';
import 'package:project_2/Cargo/women/ladies_bag.dart';
import 'package:project_2/Cargo/women/ladies_bag_details_page.dart';
import 'package:project_2/cart/screen/cargocart.dart';
import 'package:project_2/cart/screen/cart.dart';
import 'package:project_2/feedBack/FeedBack_page.dart';
import 'package:project_2/homepage/widgets/checking.dart';
import 'package:project_2/loading/loadingScreen.dart';
import 'package:project_2/homepage/pages/handcraft/cookies/cookies_page.dart';
import 'package:project_2/homepage/pages/handcraft/cookies/cookies_page_details.dart';
import 'package:project_2/homepage/pages/handcraft/drinks/drinks_page.dart';
import 'package:project_2/homepage/pages/handcraft/drinks/drinks_page_details.dart';
import 'package:project_2/homepage/pages/handcraft/snacks/snacks_page.dart';
import 'package:project_2/homepage/pages/handcraft/snacks/snacks_page_details.dart';
import 'package:project_2/homepage/pages/home_page/home_page.dart';
import 'package:project_2/homepage/pages/home_page/latest_offerings/offerings_details_page.dart';
import 'package:project_2/homepage/pages/home_page/populars/popular_details_page.dart';
import 'package:project_2/splashscreen/splash_screen.dart';
import '../Cargo/feedback_page/feedback.dart';
import '../payments/payment_app.dart';
import '../profile/address/address.dart';
import '../profile/help/help.dart';
import '../profile/my orders/order_page.dart';
import '../profile/profile.dart';
import '../profile/wishlist/wishlist.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => Cart());

      case '/loading':
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      case '/feedback':
        return MaterialPageRoute(builder: (_) => FeedBackPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/payment':
        return MaterialPageRoute(
            builder: (_) => PaymentApp(
                  coffee: true,
                  checkout: true,
                ));
      case '/snacks':
        return MaterialPageRoute(builder: (_) => SnacksPage());
      case '/drinks':
        return MaterialPageRoute(builder: (_) => DrinksPage());
      case '/cookies':
        return MaterialPageRoute(builder: (_) => CookiesPage());
      case '/checking':
        return MaterialPageRoute(builder: (_) => Checking());
      case '/cookiesdetails':
        return MaterialPageRoute(
            builder: (_) => CookiesPageDetails(
                  detail: args,
                ));
      case '/drinksdetails':
        return MaterialPageRoute(
            builder: (_) => DrinksPageDetails(
                  detail: args,
                ));
      case '/snacksdetails':
        return MaterialPageRoute(
            builder: (_) => SnacksDetailsPage(
                  detail: args,
                ));
      case '/offerspage':
        return MaterialPageRoute(
            builder: (_) => OfferingsDetailsPage(
                  offer: args,
                ));
      case '/popularspage':
        return MaterialPageRoute(
            builder: (_) => PopularDetailsPage(
                  popular: args,
                ));
      case '/shoepage':
        return MaterialPageRoute(builder: (_) => MenShoe());
      case '/bagpage':
        return MaterialPageRoute(builder: (_) => LadiesBag());

      case '/menDetails':
        return MaterialPageRoute(
            builder: (_) => MenShoeDetailPage(
                  detail: args,
                ));
      case '/ladiesDetails':
        return MaterialPageRoute(
            builder: (_) => LadiesBagDetailsPage(
                  detail: args,
                ));

      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/myOrders':
        return MaterialPageRoute(builder: (_) => OrderPage());
      case '/wishlist':
        return MaterialPageRoute(builder: (_) => Wishlist());
      case '/help':
        return MaterialPageRoute(builder: (_) => Help());
      case '/address':
        return MaterialPageRoute(builder: (_) => Address());
      case '/cargocart':
        return MaterialPageRoute(builder: (_) => Cargocart());
      case '/cargofeedback':
        return MaterialPageRoute(builder: (_) => FeedbackPageCargo());
    }

    throw AboutListTile();
  }
}
