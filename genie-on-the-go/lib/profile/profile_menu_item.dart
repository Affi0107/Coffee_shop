// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/color_constants.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem(
      {super.key,
      required this.title,
      required this.iconName,
      required this.pressed});

  final String title;
  final IconData iconName;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
            leading: Icon(
              iconName,
              size: 26,
              color: leadingIconColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            trailing: Icon(
              FontAwesomeIcons.angleRight,
              size: 18,
              color: trailingIconColor,
            )),
      ),
    );
  }
}
