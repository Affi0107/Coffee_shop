import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class orderrecieved extends StatelessWidget {
  const orderrecieved({super.key});

  @override
  Widget build(BuildContext context) {
  
  return Container(
      height: 100,
      color:nobuttonpressedcolor,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.schedule,
              color: scheduleiconcolor,
            ),
            Text(
              noclicked,
              style: TextStyle(color: schedulemsgcolor),
            ),
          ],
        ),
      ),
    );
  }
}