// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/cart/screen/delivery_dialog.dart';
import 'package:project_2/cart/widget/Tip.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/payments/payment_app.dart';

import 'charges.dart';

class Bottom extends ConsumerWidget {
  final double subtotal;
  final tip;
  final coffee;
  final double gst;
  const Bottom(
      {super.key,
      required this.coffee,
      required this.gst,
      required this.subtotal,
      required this.tip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double total = double.parse(gst.toStringAsFixed(2)) +
        double.parse(subtotal.toStringAsFixed(2));

    Widget delievery = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16.0,
        ),
        backgroundColor: bottomcheckoutcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: bottomroundrectanglebordercolor,
          ),
        ),
      ),
      onPressed: () {
        ref
            .read(TipProvider.notifier)
            .setgst(double.parse(gst.toStringAsFixed(2)));

        showDialog(
          context: context,
          builder: (context) {
            return DeliveryDialog(coffee: coffee);
          },
        );
      },
      child: Text(
        delivery,
        style: TextStyle(
            color: cookinginstructiontextcolor,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),
    );

    // ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: 32,
    //       vertical: 16.0,
    //     ),
    //     backgroundColor: bottomelevatebuttonbgcolor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8.0),
    //       side: BorderSide(
    //         color: bottomroundrectanglebordercolor,
    //       ),
    //     ),
    //   ),
    //   onPressed: () {
    //     ref.read(TipProvider.notifier)
    //       ..setgst(double.parse(gst.toStringAsFixed(2)));

    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return DeliveryDialog(coffee: coffee);
    //       },
    //     );
    //   },
    //   child: Text(
    //     delivery,
    //     style: TextStyle(color: bottomcheckoutcolor),
    //   ),
    // );

    return Container(
      padding: const EdgeInsets.only(
        left: 14.0,
        right: 13,
        bottom: 8.0,
        top: 0,
      ),
      decoration: BoxDecoration(
        color: bottomboxdecorationcolor,

        // boxShadow: [
        //   BoxShadow(
        //       color: bottomboxshadowcolor,
        //       offset: Offset(1, 1),
        //       spreadRadius: 2,
        //       blurRadius: 1)
        // ],
        // border: DashedBorder(
        //     dashLength: 12,
        //     top: BorderSide(
        //         color: Colors.black, width: 7, style: BorderStyle.solid))),
        // border: Border(
        //     top: BorderSide(
        //         width: 4,
        //         strokeAlign: BorderSide.strokeAlignInside,
        //         color: Colors.black)),
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      ),
      child: Column(
        children: [
          // Positioned(
          //   width: double.infinity,
          //   top: -10,
          //   child: Row(
          //     children: List.generate(
          //         1800 ~/ 33,
          //         (index) => Expanded(
          //               child: Container(
          //                 color: index % 2 == 0
          //                     ? bottomcontainercolor1
          //                     : bottomcontainercolor,
          //                 height: 3.5,
          //               ),
          //             )),
          //   ),
          // ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.receipt,
                color: bottomcontainercolor1,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                billdetails,
                style: TextStyle(
                    color: bottomcontainercolor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
            ],
          ),
          Charges(
              name: "SubTotal",
              cost: double.parse(subtotal.toStringAsFixed(2))),
          //Charges(name: "Shipping Cost", cost: 10),
          Charges(name: billGst, cost: double.parse(gst.toStringAsFixed(2))),

          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: List.generate(
                  300 ~/ 5,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? bottomcontainercolor
                              : bottomcontainercolor1,
                          height: 2,
                        ),
                      )),
            ),
          ),
          Charges(
              name: billTotal, cost: double.parse(total.toStringAsFixed(2))),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: coffee == false
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16.0,
                  ),
                  backgroundColor: bottomcheckoutcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: bottomroundrectanglebordercolor,
                    ),
                  ),
                ),
                onPressed: () {
                  ref
                      .watch(TipProvider.notifier)
                      .setgst(double.parse(gst.toStringAsFixed(2)));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PaymentApp(coffee: coffee, checkout: true)));
                },
                child: Text(
                  checkout,
                  style: TextStyle(
                      color: cookinginstructiontextcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              coffee == false
                  ? delievery
                  : SizedBox(
                      width: 0,
                    )
            ],
          ),
        ],
      ),
    );
  }
}
