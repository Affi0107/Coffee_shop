// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../../../appbar/appbar_widget.dart';
import '../../../data_fetching/api_service.dart';
import '../../../model/json_model.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class OfferingsDetailsPage extends StatefulWidget {
  const OfferingsDetailsPage({super.key, required this.offer});

  final offer;

  @override
  State<OfferingsDetailsPage> createState() => _OfferingsDetailsPageState();
}

class _OfferingsDetailsPageState extends State<OfferingsDetailsPage> {
  List<JsonModel> drinks = [];
  List<JsonModel> cookies = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (widget.offer.category == "Coffee") {
      fetchCookies();
    } else if (widget.offer.category == "Cookies") {
      fetchDrinks();
    } else {
      fetchDrinks();
    }
  }

  Future<void> fetchDrinks() async {
    print("fetchDrinks Called");
    drinks = await ApiService.fetchCoffeeData();
    setState(() {});
    print("fetchDrinks Completed");
  }

  Future<void> fetchCookies() async {
    print("fetchCookies Called");
    cookies = await ApiService.fetchCookiesData();
    setState(() {});
    print("fetchCookies Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Color.fromARGB(255, 12, 15, 20),
      // appBar: AppbarWidget(),
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      body: DetailsPageWidget(
        details: widget.offer,
        fetchProducts: widget.offer.category == "Coffee"
            ? cookies
            : widget.offer.category == "Cookies"
                ? drinks
                : drinks,
        nextPage: widget.offer.category == "Coffee"
            ? '/cookiesdetails'
            : widget.offer.category == "Cookies"
                ? '/drinksdetails'
                : '/drinksdetails',
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
