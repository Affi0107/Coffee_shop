// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/Cargo/feedback_page/stepper.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/cart/riverpod/order_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

class FeedbackPageCargo extends ConsumerStatefulWidget {
  const FeedbackPageCargo({super.key});

  @override
  ConsumerState<FeedbackPageCargo> createState() => _FeedbackPageCargoState();
}

class _FeedbackPageCargoState extends ConsumerState<FeedbackPageCargo> {
  DateTime deliveryDate = DateTime.now();
  late DateTime futureDate = deliveryDate.add(const Duration(days: 5));

  @override
  Widget build(BuildContext context) {
    var indl = ref.read(OrderProvider).length;
    return Scaffold(
        appBar: AppbarWidget(incart: true),
        body: BackgroundContainerWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Statusindicator(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        username,
                        style: TextStyle(fontSize: 33),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: feedbackBackShadow,
                              blurRadius: 7.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: bttnBoxColor),
                      child: Column(
                        children: [
                          Text(
                            orderPlacedText,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 23),
                          ),
                          Image.asset(
                            "assets/images/complete.png",
                            height: 45,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            "$orderId CWT00$indl",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "${deliveryDetails}: ${(futureDate.day).toString()}/${(futureDate.month).toString()}/${(futureDate.year).toString()}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(10),
                              backgroundColor:
                                  MaterialStatePropertyAll(feedbackbttnColor)),
                          onPressed: () {},
                          child: Text(manageOrder,
                              style: TextStyle(
                                  color: manageOrderTextColor, fontSize: 20))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(deliveryAdd,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 13,
                          ),
                          Text(deliverydata,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 7, right: 7),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: feedbackBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: Text(
                    navText,
                    style: TextStyle(color: navTextColor, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
