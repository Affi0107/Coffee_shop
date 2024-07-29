import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    // bool feedbackGiven = true;
    return Container(
      height: 100,
      color: Colors.green,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outlined,
              color: textcolour,
            ),
            Text(
              endrating,
              style: TextStyle(color: textcolour),
            ),
          ],
        ),
      ),
    );
  }
}
