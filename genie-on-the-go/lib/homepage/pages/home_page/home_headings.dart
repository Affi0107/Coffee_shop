import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading(
      {super.key,
      required this.headingText,
      required this.headingText_fontSize});
  final String headingText;
  final double headingText_fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: headingText_fontSize,
          color: Color.fromARGB(232, 255, 255, 255)),
    );
  }
}
