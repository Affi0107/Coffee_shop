// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/homepage/bloc/home_bloc.dart';
import 'package:project_2/homepage/pages/home_page/home_headings.dart';
import 'package:project_2/homepage/constant_homepage/constant_categories.dart';
import 'package:project_2/homepage/constant_homepage/constant_offers.dart';
import 'package:project_2/homepage/constant_homepage/constant_populars.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import '../../../appbar/custom_appbar_widget.dart';
import '../../reusable_widgets/background_container_widget.dart';
import 'latest_offerings/offerings_widget.dart';
import 'populars/popular_widget.dart';
import '../handcraft/handcraft_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) => {
        if (state is HomeNavigateToOfferPageActionState)
          {
            Navigator.pushNamed(context, '/drinks'),
          }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: DrawerScreen(),
          extendBodyBehindAppBar: true,
          body: BackgroundContainerWidget(
            child: SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  CustomAppbarWidget(
                    scaffoldKey: _scaffoldKey,
                  ),
                  Positioned(
                    top: 95,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KAFICULTURE",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Transform.translate(
                            offset: Offset(0, -5),
                            child: Text(
                              "Where every cup tells a story",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Ephesis',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height - 235,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          //---------------->Latest Offerings
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 8),
                            child: HomeHeading(
                                headingText: heading1,
                                headingText_fontSize: heading1_fontSize),
                          ),

                          // ---------------->Latest Offerings widget
                          OfferingsWidget(),

                          //---------------->Categories
                          Padding(
                              padding: EdgeInsets.only(top: 7, left: 8),
                              child: HomeHeading(
                                  headingText: heading2,
                                  headingText_fontSize: heading2_fontSize)),

                          //---------------->Categories widget
                          HandCraftedWidget(),

                          // ---------------------------->Popular
                          Padding(
                              padding: EdgeInsets.only(top: 3, left: 8),
                              child: HomeHeading(
                                  headingText: heading3,
                                  headingText_fontSize: heading3_fontSize)),

                          //-------------------------->popular widget
                          PopularWidget(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
