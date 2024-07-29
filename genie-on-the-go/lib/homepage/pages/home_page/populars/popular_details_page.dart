// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import '../../../data_fetching/api_service.dart';
import '../../../model/json_model.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class PopularDetailsPage extends StatefulWidget {
  const PopularDetailsPage({super.key, required this.popular});

  final popular;

  @override
  State<PopularDetailsPage> createState() => _PopularDetailsPageState();
}

class _PopularDetailsPageState extends State<PopularDetailsPage> {
  List<JsonModel> drinks = [];
  List<JsonModel> cookies = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (widget.popular.category == "Coffee") {
      fetchCookies();
    } else if (widget.popular.category == "Cookies") {
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
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      body: DetailsPageWidget(
        details: widget.popular,
        fetchProducts: widget.popular.category == "Coffee"
            ? cookies
            : widget.popular.category == "Cookies"
                ? drinks
                : drinks,
        nextPage: widget.popular.category == "Coffee"
            ? '/cookiesdetails'
            : widget.popular.category == "Cookies"
                ? '/drinksdetails'
                : '/drinksdetails',
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
