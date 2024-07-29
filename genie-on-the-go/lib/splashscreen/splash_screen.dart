import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';

import 'package:project_2/homepage/pages/home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: SweepGradient(colors: [
            spalshscreensweepgradientcolor1,
            splashscreensweepgradientcolor2,
            splashscreensweepgradientcolor3
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/logo1.png",
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
