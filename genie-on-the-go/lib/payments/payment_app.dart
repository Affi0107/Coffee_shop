// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass/glass.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:project_2/cart/riverpod/order_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/feedBack/thankYou.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/newfeature/amount.dart';
import 'package:project_2/newfeature/company_name.dart';
import 'package:project_2/newfeature/payment_cart.dart';
import '../cart/riverpod/cargo_state_provider.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

// ignore: camel_case_types
class PaymentApp extends ConsumerStatefulWidget {
  PaymentApp({super.key, required this.coffee, required this.checkout});
  final coffee;
  final checkout;

  @override
  ConsumerState createState() => _PaymentAppState();
}

// ignore: camel_case_types
class _PaymentAppState extends ConsumerState<PaymentApp> {
  // ignore: unused_field, prefer_final_fields
  //SingingCharacter? _character = SingingCharacter.Paytm;

  final ExpansionTileController controller = ExpansionTileController();
  final ExpansionTileController upiExpansionController =
      ExpansionTileController();
  final Razorpay _razorpay = Razorpay();

  bool swapChecked = true;
  bool cashOnDeliveryChecked = false;
  bool initiallyExpanded = true;

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    var datedata = DateTime.now();
    var date = "${datedata.day}/${datedata.month}/${datedata.year}";
    var time = "${datedata.hour}:${datedata.minute}";
    var newday = (datedata.day + 4) % 31 == 0 ? 1 : (datedata.day + 4) % 31;
    var deliveryby = "${newday}/${datedata.month}/${datedata.year}";
    print(deliveryby);
    if (widget.coffee == true) {
      ref.read(OrderProvider.notifier).add({
        "data": ref.read(CartProvider),
        "date": date,
        "time": time,
        "deliveryby": deliveryby
      });
      ref.read(CartProvider.notifier).empty();
      Navigator.pushNamed(context, "/feedback");
    } else {
      ref.read(OrderProvider.notifier).add({
        "data": ref.read(CargoProvider),
        "date": date,
        "time": time,
        "deliveryby": deliveryby
      });
      ref.read(CargoProvider.notifier).empty();
      Navigator.pushNamed(context, "/cargofeedback");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.pushNamed(context, "/payment");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  double dollar = 0;
  double itcvalue = 0;
  double handm_value = 0;
  double airvalue = 0;
  double itcEquivalent = 0;
  double h_mEquivalent = 0;
  double airEquivalent = 0;
  bool isPaused = false;
  double final_value = 0;
  int deliveryCharges = Random().nextInt(10) + 25;
  late String deliveryToString;

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = widget.coffee == true
        ? ref.watch(CartProvider)
        : ref.watch(CargoProvider);
    // print("ddddddd $data");
    final tc = data.isNotEmpty ? data.map((e) => e["cost"] * 1) : [];
    double myvalue = 0;
    double cost =
        tc.length != 0 ? tc.reduce((value, element) => value + element) : 0;

    double subt = cost;
    final double gst = double.parse((subt * 0.05).toStringAsFixed(2));
    if (widget.coffee) {
      subt += (gst);
      deliveryToString = "Free";
    } else {
      subt += (gst + deliveryCharges);
      deliveryToString = "\$ ${(deliveryCharges).toStringAsFixed(2)}";
    }
    final_value = subt * 0.5;

    final amount = double.parse(subt.toStringAsFixed(2));
    final amount1 = double.parse(final_value.toStringAsFixed(2));
    double loyality_value = itcvalue * 0.2 + handm_value * 0.2 + airvalue * 0.5;
    double final_price = amount - loyality_value;
    double final_price1 = amount1 - loyality_value;

    String strPrice;
    if (final_price1 <= 0.00) {
      strPrice = "\$ ${amount1.toStringAsFixed(2)}";
      ;
      itcEquivalent = itcvalue * 0.2;
      h_mEquivalent = handm_value * 0.2;
      airEquivalent = airvalue * 0.5;
      loyality_value = itcvalue * 0.2 + handm_value * 0.2 + airvalue * 0.5;
      isPaused = true;
      final_value = 0;
    } else {
      strPrice = "\$ ${final_price.toStringAsFixed(2)}";
      if (swapChecked) {
        itcEquivalent = itcvalue * 0.2;
        h_mEquivalent = handm_value * 0.2;
        airEquivalent = airvalue * 0.5;
        loyality_value = itcvalue * 0.2 + handm_value * 0.2 + airvalue * 0.5;
      } else {
        loyality_value = 0;
        itcEquivalent = 0;
        h_mEquivalent = 0;
        airEquivalent = 0;
      }
      final_value = final_price1;
      if (isPaused == true) {
        isPaused = false;
      }
    }

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppbarWidget(
        coffee: widget.coffee,
      ),
      drawer: DrawerScreen(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/paymentbgg.jpg"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 8),
                      child: Text(
                        orders,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LimitedBox(
                        maxHeight: 250,
                        child: SingleChildScrollView(
                          child: Column(
                            children: data.map((data1) {
                              return PaymentCart(
                                data: data1,
                                atpayment: true,
                              );
                            }).toList(),
                          ),
                        )),
                  ],
                ),
              ),

              //--------------------------------------------------------Amount

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     paymentapplineargradient1,
                          //     paymentapplineargradient2,
                          //   ],
                          // ),
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                totalamount,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: paymentapppricecolor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${swapChecked == false ? "\$ ${amount.toString()}" : strPrice == "-0.00" ? 0.00 : strPrice}",
                                // ' ${strPrice == "-0.00" ? 0.00 : strPrice}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: paymentapppricecolor,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                      children: [
                        ExpansionTile(
                          title: Amount(
                            text: subtotal,
                            price: "\$ ${amount.toString()}",
                            fontSize: 20,
                            fontColor: loyalitypointcolor,
                            leftPadding: 5,
                            rightPadding: 0,
                            topPadding: 0,
                            bottomPadding: 0,
                          ),
                          children: [
                            Amount(
                              text: priceText,
                              price: "\$ ${(cost).toStringAsFixed(2)}",
                              fontSize: 18,
                              fontColor: paymentapphotelcolor,
                              leftPadding: 20,
                              rightPadding: 20,
                              topPadding: 0,
                              bottomPadding: 0,
                            ),
                            Amount(
                              text: deliveryText,
                              price: deliveryToString,
                              fontSize: 18,
                              fontColor: paymentapphotelcolor,
                              leftPadding: 20,
                              rightPadding: 20,
                              topPadding: 0,
                              bottomPadding: 0,
                            ),
                            Amount(
                              text: gstText,
                              price: "\$ ${(gst).toStringAsFixed(2)}",
                              fontSize: 18,
                              fontColor: paymentapphotelcolor,
                              leftPadding: 20,
                              rightPadding: 20,
                              topPadding: 0,
                              bottomPadding: 0,
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: Amount(
                            text: loyalitypointequivalent,
                            price: "\$ ${(loyality_value).toStringAsFixed(2)}",
                            fontSize: 20,
                            fontColor: loyalitypointcolor,
                            leftPadding: 5,
                            rightPadding: 0,
                            topPadding: 5,
                            bottomPadding: 5,
                          ),
                          children: [
                            Amount(
                              text: hotel1,
                              price: "\$ ${(itcEquivalent).toStringAsFixed(2)}",
                              fontSize: 18,
                              fontColor: paymentapphotelcolor,
                              leftPadding: 20,
                              rightPadding: 20,
                              topPadding: 5,
                              bottomPadding: 5,
                            ),
                            Amount(
                              text: hotel2,
                              price: "\$ ${(h_mEquivalent).toStringAsFixed(2)}",
                              fontSize: 18,
                              fontColor: paymentapphotelcolor,
                              leftPadding: 20,
                              rightPadding: 20,
                              topPadding: 5,
                              bottomPadding: 5,
                            ),
                            Amount(
                              text: hotel3,
                              price: "\$ ${(airEquivalent).toStringAsFixed(2)}",
                              fontSize: 18,
                              fontColor: paymentapphotelcolor,
                              leftPadding: 20,
                              rightPadding: 20,
                              topPadding: 5,
                              bottomPadding: 5,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //-------------------------------------------------newSwap

                    ExpansionTile(
                      initiallyExpanded: swapChecked,
                      controller: controller,
                      title: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                  child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      side: BorderSide(
                                          color: checkboxSideColor, width: 2),
                                      activeColor: checkboxActiveColor,
                                      checkColor: checkboxCheckColor,
                                      value: swapChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          swapChecked = value!;
                                          // cashOnDeliveryChecked = !value;
                                        });
                                      }),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      gradient: LinearGradient(colors: [
                                        Colors.white,
                                        Colors.white,
                                        Colors.transparent,
                                      ])),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      "assets/images/swap.png",
                                      height: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recommended,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: recommendedtextcolor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      children: [
                        Column(
                          children: [
                            //                                                        ITC International
                            CompanyName(
                              companyName: hotel1,
                              companyLogo: "assets/images/itc.png",
                              value: itcvalue,
                              points: 5,
                              factor: 0.2,
                              pointsUsed:
                                  (itcEquivalent * 5).toStringAsFixed(2),
                              child: Slider(
                                inactiveColor: Colors.grey,
                                divisions: 100,
                                label: " ${itcvalue.toStringAsFixed(2)}/100",
                                activeColor: Color.fromRGBO(143, 93, 58, 1),
                                value: itcvalue.toDouble(),
                                onChanged: (double newValue) {
                                  final value = newValue - itcvalue;
                                  if (value > 0) {
                                    if (final_value <= value * 0.2) {
                                      if (itcvalue > newValue) {
                                        itcvalue = newValue;
                                      } else {
                                        setState(() {
                                          if (itcvalue == 0) {
                                            itcvalue = final_value * 5;
                                          } else {
                                            itcvalue =
                                                itcvalue + final_value * 5;
                                          }
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        itcvalue = newValue;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      itcvalue = newValue;
                                    });
                                  }
                                },
                                min: 0,
                                max: 100,
                              ),
                            ),

                            //                                                        H&M
                            CompanyName(
                              companyName: hotel2,
                              companyLogo: "assets/images/h&m.png",
                              value: handm_value,
                              points: 5,
                              factor: 0.2,
                              pointsUsed:
                                  (h_mEquivalent * 5).toStringAsFixed(2),
                              child: Slider(
                                inactiveColor: Colors.grey,
                                divisions: 100,
                                label: " ${handm_value.toStringAsFixed(2)}/100",
                                activeColor: Color.fromRGBO(143, 93, 58, 1),
                                value: handm_value.toDouble(),
                                onChanged: (double newValue) {
                                  final value = newValue - handm_value;
                                  if (value > 0) {
                                    if (final_value <= value * 0.2) {
                                      if (handm_value > newValue) {
                                        handm_value = newValue;
                                      } else {
                                        setState(() {
                                          if (handm_value == 0) {
                                            handm_value = final_value * 5;
                                          } else {
                                            handm_value =
                                                handm_value + final_value * 5;
                                          }
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        handm_value = newValue;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      handm_value = newValue;
                                    });
                                  }
                                },
                                min: 0,
                                max: 100,
                              ),
                            ),

                            //                                                         Emirates

                            CompanyName(
                              companyName: hotel3,
                              companyLogo: "assets/images/air.png",
                              value: airvalue,
                              points: 2,
                              factor: 0.5,
                              pointsUsed:
                                  (airEquivalent * 2).toStringAsFixed(2),
                              child: Slider(
                                inactiveColor: Colors.grey,
                                divisions: 100,
                                label: " ${airvalue.toStringAsFixed(2)}/100",
                                activeColor: Color.fromRGBO(143, 93, 58, 1),
                                value: airvalue.toDouble(),
                                onChanged: (double newValue) {
                                  final value = newValue - airvalue;
                                  if (value > 0) {
                                    if (final_value <= value * 0.5) {
                                      if (airvalue > newValue) {
                                        airvalue = newValue;
                                      } else {
                                        setState(() {
                                          if (airvalue == 0) {
                                            airvalue = final_value * 2;
                                          } else {
                                            airvalue =
                                                airvalue + final_value * 2;
                                          }
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        airvalue = newValue;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      airvalue = newValue;
                                    });
                                  }
                                },
                                min: 0,
                                max: 100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                  ],
                ).asGlass(
                    tintColor: Colors.white,
                    clipBorderRadius: BorderRadius.circular(15.0)),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: paymentborderallgradient1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "${swapChecked == false ? "\$ ${amount.toString()}" : strPrice == "-0.00" ? 0.00 : strPrice}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  incltaxes,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            InkWell(
              onTap: () {
                if (final_price > 0) {
                  double dollar;
                  if (swapChecked) {
                    dollar = final_price;
                  } else {
                    dollar = amount;
                  }
                  // double dollar = final_price * 84;
                  //double dollar =${swapChecked == false ? "\$ ${amount.toString()}" : (strPrice == "-0.00") ? 0.00 : strPrice;};

                  var options = {
                    'key': key,
                    'amount': 100 * dollar,
                    'currency': 'USD',
                    'name': apptitle,
                    'description': appslogan,
                  };

                  _razorpay.open(options);
                } else {
                  if (widget.coffee == true) {
                    ref
                        .read(OrderProvider.notifier)
                        .add(ref.read(CartProvider));
                    ref.read(CartProvider.notifier).empty();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => true);
                    Navigator.pushNamed(context, "/feedback");
                  } else {
                    ref
                        .read(OrderProvider.notifier)
                        .add(ref.read(CargoProvider));
                    ref.read(CargoProvider.notifier).empty();

                    widget.checkout == true
                        ? (
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => true),
                            Navigator.pushNamed(context, "/feedback")
                          )
                        : (
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => true),
                            Navigator.pushNamed(context, "/cargofeedback")
                          );
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: paymentborderall),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 209, 117, 55),
                      Color.fromARGB(255, 138, 86, 51),
                      Color.fromARGB(255, 173, 127, 97),
                    ],
                  ),
                ),
                width: mediaWidth * 0.65,
                height: 55,
                child: Center(
                  child: Text(
                    confirm,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: confirmcolor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
