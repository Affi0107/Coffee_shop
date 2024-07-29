import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class yesreceived extends StatelessWidget {
  const yesreceived({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
      height: 100,
      color:nobuttonpressedcolor,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              yesclicked,
              style: TextStyle(color: schedulemsgcolor),
            ),
          ],
        ),
      ),
    );
  }
}