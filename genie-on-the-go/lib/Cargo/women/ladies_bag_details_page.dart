// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/Cargo/women/widget/ladies_details_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import '../../homepage/model/cargo_json_model.dart';

class LadiesBagDetailsPage extends StatefulWidget {
  const LadiesBagDetailsPage({super.key, required this.detail});

  final detail;

  @override
  State<LadiesBagDetailsPage> createState() => _LadiesBagDetailsPageState();
}

class _LadiesBagDetailsPageState extends State<LadiesBagDetailsPage> {
  List<CargoJsonModel> ladiesAccessories = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchLadiesAccessories();
  }

  Future<void> fetchLadiesAccessories() async {
    print("fetchLadiesAccessories Called");
    ladiesAccessories = await ApiService.fetchLadiesAccessoriesData();
    setState(() {});
    print("fetchLadiesAccessories Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      body: LadiesDetailsWidget(
        details: widget.detail,
        fetchProducts: ladiesAccessories,
        nextPage: '/ladiesDetails',
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
