// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

import '../../appbar/custom_appbar_widget.dart';
import '../../constants/text_constants.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({super.key, required this.scaffoldKey});

  final scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BackgroundContainerWidget(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CustomAppbarWidget(
                scaffoldKey: scaffoldKey,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    comingsoonText,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: comingsoonTextColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    FontAwesomeIcons.faceSmile,
                    size: 32,
                    color: comingsoonTexticonColor,
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
