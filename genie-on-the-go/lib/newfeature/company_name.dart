import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({
    super.key,
    required this.companyName,
    required this.companyLogo,
    required this.value,
    required this.child,
    required this.points,
    required this.factor,
    required this.pointsUsed,
  });

  final String companyName;
  final String companyLogo;
  final double value;
  final String pointsUsed;
  final int points;
  final double factor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, right: 16, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(companyLogo))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      companyName,
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: nameColor),
                    ),
                  ),
                ],
              ),
              Text(
                "Used: $pointsUsed/100 pts.",
                style: TextStyle(fontSize: 15, color: nameColor),
              ),
              // Column(
              //   children: [
              //     Text(
              //       "Used: $pointsUsed pts.",
              //       style: TextStyle(fontSize: 15),
              //     ),
              //     Text(
              //       "Total: 100 pts.",
              //       style: TextStyle(fontSize: 15),
              //     ),
              //   ],
              // ),

              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(4)),
              //   width: 50,
              //   height: 35,
              //   child: formchild,
              // )
            ],
          ),
        ),
        SizedBox(
          child: child,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 15),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     companynameboxdecorationlineargradcolor,
                    //     companynameboxdecorationlineargradcolor1,
                    //   ],
                    // ),
                    ),
                child: Text(
                  "1USD=$points $companyName Points",
                  style: TextStyle(fontSize: 15, color: nameColor),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
