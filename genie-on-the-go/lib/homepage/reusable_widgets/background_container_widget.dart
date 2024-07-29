// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:project_2/constants/color_constants.dart';

class BackgroundContainerWidget extends StatelessWidget {
  const BackgroundContainerWidget({
    super.key,
    this.child,
  });

  final child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(16, 16, 16, 1),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Color(0xFF434343),
            Colors.black,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: child,
      ),
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
      //   child: child,
      // ),
    );
  }
}
