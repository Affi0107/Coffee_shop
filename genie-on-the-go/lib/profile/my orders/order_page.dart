// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import '../../appbar/custom_appbar_widget.dart';
import '../../cart/riverpod/order_provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_constants.dart';
import '../../homepage/reusable_widgets/background_container_widget.dart';

class OrderPage extends ConsumerWidget {
  OrderPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final DateTime todaysDate = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(OrderProvider);
    Widget noOrder = Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          noOrderText,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: noOrderTextColor),
        ),
        SizedBox(width: 8),
        Icon(
          FontAwesomeIcons.faceSmile,
          size: 32,
          color: noOrderTexticonColor,
        )
      ],
    ));
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        drawer: DrawerScreen(),
        body: BackgroundContainerWidget(
            child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                CustomAppbarWidget(
                  scaffoldKey: _scaffoldKey,
                ),
                data.length == 0
                    ? noOrder
                    : Positioned(
                        top: 90,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Column(
                                    children: data[index]["data"]
                                        .map<Widget>((e) => Padding(
                                              padding: const EdgeInsets.all(13),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        cartLinearGrad1,
                                                        cartLinearGrad2,
                                                        cartLinearGrad3
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end: Alignment
                                                          .bottomRight),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          everyOrderContainerShadowColor,
                                                      blurRadius: 2,
                                                      spreadRadius: 1,
                                                      offset: Offset(0, 5),
                                                    )
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(13),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 75,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            13),
                                                                image: DecorationImage(
                                                                    image: AssetImage(e[
                                                                        "icon"]),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          ),
                                                          SizedBox(width: 20),
                                                          Container(
                                                            width: 235,
                                                            height: 80,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(
                                                                  e["name"],
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          headingNameColor),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      FontAwesomeIcons
                                                                          .dollarSign,
                                                                      size: 21,
                                                                      color:
                                                                          tagcolor,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            3),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          priceHeadingText,
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: headingcolor),
                                                                        ),
                                                                        Text(
                                                                          e["cost"]
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: headingNameColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  FontAwesomeIcons
                                                                      .tag,
                                                                  size: 23,
                                                                  color:
                                                                      tagcolor,
                                                                ),
                                                                SizedBox(
                                                                    width: 5),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      orderHeadingText,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              headingcolor),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            3),
                                                                    Text(
                                                                      "CWT00$index",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              19,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              headingNameColor),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  FontAwesomeIcons
                                                                      .truckFast,
                                                                  size: 23,
                                                                  color:
                                                                      tagcolor,
                                                                ),
                                                                SizedBox(
                                                                    width: 15),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      deliveryHeadingText,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              headingcolor),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            3),
                                                                    Text(
                                                                      "${todaysDate.day.toString()}/${todaysDate.month.toString()}/${todaysDate.year.toString()}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              19,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              headingNameColor),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ))
                                        .toList());
                              }),
                        ),
                      ),
              ],
            ),
          ),
        )));
  }
}
