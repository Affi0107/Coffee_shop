// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';

class Charges extends StatelessWidget {
  final String name;
  final cost;
  const Charges({super.key, required this.name, required this.cost});

  @override
  Widget build(BuildContext context) {
    final n = cost;
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
                color: bottomcontainercolor1,
                fontWeight: (name == "Subtotal" || name == "Total")
                    ? FontWeight.bold
                    : FontWeight.w500,
                fontSize: (name == "Subtotal" || name == "Total") ? 22 : 17),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$ ${cost}",
                style: TextStyle(
                    color: bottomcontainercolor1,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        (name == "Subtotal" || name == "Total") ? 22 : 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
