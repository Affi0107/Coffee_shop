// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/Cargo/men/widget/men_details_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import '../../homepage/model/cargo_json_model.dart';

class MenShoeDetailPage extends StatefulWidget {
  const MenShoeDetailPage({super.key, required this.detail});
  final detail;

  @override
  State<MenShoeDetailPage> createState() => _MenShoeDetailPageState();
}

class _MenShoeDetailPageState extends State<MenShoeDetailPage> {
  List<CargoJsonModel> mensAccessories = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchMensAccessories();
  }

  Future<void> fetchMensAccessories() async {
    print("fetchMensAccessories Called");
    mensAccessories = await ApiService.fetchMenAccessoriesData();
    setState(() {});
    print("fetchMensAccessories Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      body: CargoDetailsPageWidget(
        details: widget.detail,
        fetchProducts: mensAccessories,
        nextPage: '/menDetails',
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
