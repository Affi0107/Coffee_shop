// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/constants/color_constants.dart';

class MyPopUp extends StatefulWidget {
  const MyPopUp({
    Key? key,
    required this.bgcolor1,
    required this.textMsg,
    required this.bottomHeight,
    required this.bgcolor2,
  }) : super(key: key);

  final Color bgcolor1;
  final Color bgcolor2;
  final String textMsg;
  final double bottomHeight;

  @override
  State<MyPopUp> createState() => _MyPopUpState();
}

class _MyPopUpState extends State<MyPopUp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      actions: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  mypopupgradientcolor1,
                  mypopupgradientcolor2,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: mypopupborderallcolor,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    mypopupgradientcolor1,
                    mypopupgradientcolor2,
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1.5,
                  color: mypopupborderradiuscolor,
                ),
              ),
              child: Center(
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //----------------------------------------------------------
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 200,
                                width: mediaWidth * 0.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(17),
                                        topRight: Radius.circular(17)),
                                    gradient: RadialGradient(colors: [
                                      widget.bgcolor1,
                                      widget.bgcolor2
                                    ])),
                                child: //it provide loading animation
                                    Lottie.asset(
                                        "assets/json/animations/thankyou.json")),
                            Container(
                              height: widget.bottomHeight,
                              width: mediaWidth * 0.7,
                              decoration:
                                  BoxDecoration(color: mypopupboxdeccolor),
                              child: Scaffold(
                                body: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(widget.textMsg,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
