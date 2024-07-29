// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/cart/widget/Tipbutton.dart';

class Tip extends ConsumerWidget {
  const Tip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tip = ref.watch(TipProvider)["tip"].toInt();

    return Container(
      width: double.infinity,
      height: 87,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 238, 238),
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2, bottom: 5),
            child: Text(
              tip,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   margin: EdgeInsets.only(left: 15),
                //   child: Text(

                //     "Tip :",
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                SizedBox(
                  width: 10,
                ),
                Tipbutton(
                  amount: 0,
                  selected: tip == 0,
                  addtip: tip,
                ),
                Tipbutton(
                  amount: 5,
                  selected: tip == 5,
                  addtip: tip,
                ),
                Tipbutton(
                  amount: 10,
                  selected: tip == 10,
                  addtip: tip,
                ),
                Tipbutton(
                  amount: 15,
                  selected: tip == 15,
                  addtip: tip,
                ),
                Tipbutton(
                  amount: 20,
                  selected: tip == 20,
                  addtip: tip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// remove first widget
//  change background color to white
// 