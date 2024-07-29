// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/homepage/reusable_widgets/detailsPage_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../../data_fetching/api_service.dart';
import '../../../model/json_model.dart';

class DrinksPageDetails extends StatefulWidget {
  const DrinksPageDetails({super.key, required this.detail});

  final detail;

  @override
  State<DrinksPageDetails> createState() => _DrinksPageDetailsState();
}

class _DrinksPageDetailsState extends State<DrinksPageDetails> {
  List<JsonModel> cookies = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchCookies();
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
      // appBar: AppbarWidget(),
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      body: DetailsPageWidget(
        details: widget.detail,
        fetchProducts: cookies,
        nextPage: '/cookiesdetails',
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
