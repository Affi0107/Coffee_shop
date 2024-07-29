// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../customdrawer/drawerScreen.dart';
import '../reusable_widget/comming_soon_widget.dart';

class Help extends StatelessWidget {
  Help({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      body: CommingSoonWidget(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
