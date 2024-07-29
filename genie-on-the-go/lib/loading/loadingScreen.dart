import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:project_2/constants/color_constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushNamed(context, "/cargofeedback");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  loadinggradientcolor1,
                  loadinggradientcolor2,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: loadingbordercolor,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    loadinglineargracolor1,
                    loadinglineargracolor2,
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1.5,
                  color: loadingbordercolor2,
                ),
              ),
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    //it provide loading animation
                    Lottie.asset("assets/json/animations/processing.json")
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
