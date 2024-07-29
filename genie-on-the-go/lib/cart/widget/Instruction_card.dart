// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/constants/text_constants.dart';

class InstructionCard extends StatelessWidget {
  const InstructionCard({super.key, this.instruction});

  final instruction;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 100,
    //   // height: 200,
    //   decoration: BoxDecoration(
    //       // color: Colors.red,
    //       borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
    //   margin: EdgeInsets.all(5),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [Icon(Icons.delivery_dining), Text(instruction, maxLines: 2)],
    //   ),
    // );

    return Container(
      width: 100,
      height: 120,
      margin: EdgeInsets.fromLTRB(7, 10, 7, 7),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 220, 218),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            offset: Offset(0, 3),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            deliveryInstruction,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          SizedBox(
              // color: Colors.red,
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sanitizer_outlined,
                        size: 50,
                      ),
                      Text(deliveryInstruction1),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.door_back_door_outlined,
                        size: 50,
                      ),
                      Text(deliveryInstruction2),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.doorbell_outlined,
                        size: 50,
                      ),
                      Text(deliveryInstruction3),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
