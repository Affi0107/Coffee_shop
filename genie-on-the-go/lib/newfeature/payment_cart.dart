// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/widget/Remove_or_Cancel.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/newfeature/bottommodaldesc.dart';

import '../constants/text_constants.dart';
// import 'package:project_2/cart/cart/widget/Remove_or_Cancel.dart';

class PaymentCart extends ConsumerStatefulWidget {
  final data;
  final atpayment;
  const PaymentCart({super.key, required this.data, this.atpayment = false});

  @override
  ConsumerState createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<PaymentCart> {
  var _showremove = false;
  // int quantity = 1;
  // int size = 1;

  @override
  Widget build(BuildContext context) {
    print("dddd ${widget.data}");
    // final addonprice =
    //     widget.data['addons'] == null ? 0 : widget.data['addons']['addonprice'];
    double amount = widget.data["cost"];
    final amount2 = double.parse(amount.toStringAsFixed(2));

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
        child: _showremove == true
            ? RemoveOrCancel(
                image: widget.data["icon"],
                name: widget.data["name"],
                setremove: () {
                  setState(() {
                    _showremove = false;
                  });
                })
            : Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 17, 17, 17),
                      Color.fromARGB(255, 39, 39, 41),
                      Color(0xFF4D4F52)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20),
                    color: paymentcartdeccolor,
                    boxShadow: [
                      BoxShadow(
                        color: paymentcartboxshadow,
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 105,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.data["icon"]),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: paymentcartboxshadow,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SizedBox(
                          // color: Colors.green,
                          width: 97,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data["name"],
                                // maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "\$ $amount2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //         showremove
                      // //             ? remove
                      SizedBox(
                        width: 10,
                      ),
                      widget.atpayment
                          ? Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      cartquantity,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${widget.data["quantity"]}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: paymentcartdeccolor1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: IconButton(
                                          mouseCursor: SystemMouseCursors.click,
                                          color: paymenttextcolor,
                                          onPressed: () {
                                            if (widget.data["quantity"] == 1) {
                                              setState(() {
                                                _showremove = true;
                                              });
                                            } else {
                                              ref
                                                  .read(CartProvider.notifier)
                                                  .decrease_quantity(
                                                      widget.data["name"]);
                                            }
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 15,
                                          )),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.data["quantity"].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: paymentcartdeccolor1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: IconButton(
                                          color: paymenttextcolor,
                                          onPressed: () {
                                            ref
                                                .read(CartProvider.notifier)
                                                .increase_quantity(
                                                    widget.data["name"]);
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 15,
                                          )),
                                    ),
                                  ],
                                ),

                                IconButton(
                                    onPressed: () {
                                      ref
                                          .watch(CartProvider.notifier)
                                          .remove_item(widget.data["name"]);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 28,
                                    ))
                                // showremove
                                //     ? remove
                              ],
                            ))
                    ])));
    // Positioned(
    //     top: -15,
    //     right: 4,
    //     child: IconButton(
    //         onPressed: () {
    //           showmodal({
    //             "addons": widget.data["addons"],
    //             "addonprice": widget.data["addonprice"],
    //             "size": widget.data["size"],
    //             "image": widget.data["icon"],
    //             "price": widget.data["price"],
    //             "name": widget.data["name"],
    //             "cost": widget.data["cost"],
    //             "quantity": widget.data["quantity"]
    //           });
    //         },
    //         icon: Icon(
    //           Icons.edit,
    //           size: 22,
    //           color: Colors.white,
    //         ))),
  }

//   showmodal(Map itemdata) {
//     int quantity = itemdata["quantity"];
//     double cost = itemdata["cost"];
//     int size = itemdata["size"];
//     double addonprice = itemdata["addonprice"];
//     int addonindex = -1;
//     List addonlist = itemdata["addons"];

//     double price = itemdata["price"];
//     // size==0?price:size==1?price/2:price/3;
//     print(price);

//     return showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           print(price);
//           return Stack(children: [
//             StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//               return BackdropFilter(
//                 filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
//                 child: Stack(children: [
//                   Positioned(
//                     child: Container(
//                       decoration:
//                           BoxDecoration(color: Color.fromARGB(255, 32, 26, 26)),
//                       padding: EdgeInsets.all(10),
//                       height: 480,
//                       // width: 23,
//                       child: Column(
//                         children: [
//                           //first widget
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 7, horizontal: 8),
//                             child: Container(
//                               padding: EdgeInsets.all(8),
//                               width: double.infinity,
//                               height: 120,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   // color: Color.fromARGB(
//                                   //     255, 17, 16, 16), // Color.fromARGB(255, 247, 235, 231),
//                                   gradient: LinearGradient(
//                                       colors: [
//                                         cartLinearGrad1,
//                                         cartLinearGrad2,
//                                         Color.fromARGB(255, 90, 92, 95)
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: cartboxshadow1,
//                                       spreadRadius: 0.5,
//                                       blurRadius: 1,
//                                       offset: Offset(0, 3),
//                                     )
//                                   ]),
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       width: 105,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(60),
//                                         image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: AssetImage(itemdata["image"]),
//                                         ),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: cartboxshadow2,
//                                             offset: Offset(0, 2),
//                                             blurRadius: 2,
//                                             spreadRadius: 2,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 8,
//                                     ),
//                                     Expanded(
//                                       child: SizedBox(
//                                         // color: Colors.green,
//                                         width: 97,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               itemdata["name"],
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: TextStyle(
//                                                 color: cartbuttoncolor,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 18,
//                                               ),
//                                             ),
//                                             Text(
//                                               "${((price * quantity) + addonprice).toStringAsFixed(2)}",
//                                               style: TextStyle(
//                                                 color: cartbuttoncolor,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     //         showremove
//                                     // //             ? remove
//                                     SizedBox(
//                                       width: 10,
//                                     ),

//                                     Container(
//                                         child: Row(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               height: 30,
//                                               width: 35,
//                                               decoration: BoxDecoration(
//                                                   //   color: Color.fromARGB(255, 19, 18, 18),
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(50))),
//                                               child: IconButton(
//                                                   mouseCursor:
//                                                       SystemMouseCursors.click,
//                                                   color: carticonbutton,
//                                                   onPressed: () {
//                                                     quantity = quantity - 1 <= 0
//                                                         ? 1
//                                                         : quantity - 1;
//                                                     setState(() {});
//                                                   },
//                                                   icon: Icon(
//                                                     Icons.remove,
//                                                     size: 22,
//                                                   )),
//                                             ),
//                                             Container(
//                                               //  color: Colors.red,
//                                               height: 30,
//                                               padding: EdgeInsets.fromLTRB(
//                                                   8, 6.8, 8, 0),
//                                               child: Text(
//                                                 "${quantity}",
//                                                 style: TextStyle(
//                                                     color: cartbuttoncolor,
//                                                     fontSize: 16,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                             Container(
//                                               height: 30,
//                                               width: 35,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(50))),
//                                               child: IconButton(
//                                                   color: carticonbutton,
//                                                   onPressed: () {
//                                                     quantity = quantity + 1;
//                                                     setState(() {});
//                                                   },
//                                                   icon: Icon(
//                                                     Icons.add,
//                                                     size: 22,
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                                   ]),
//                             ),
//                           )
//                           //for 2nd widget------------------------------------------------------------
//                           ,
//                           Container(
//                             width: double.infinity,
//                             margin: EdgeInsets.all(7),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     price = size == 0
//                                         ? price
//                                         : size == 1
//                                             ? price / 2
//                                             : price / 3;
//                                     size = 0;

//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                     height: 40,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         gradient: size == 0
//                                             ? LinearGradient(
//                                                 colors: [
//                                                     Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     Color.fromARGB(
//                                                         255, 61, 62, 65),
//                                                   ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight)
//                                             : LinearGradient(
//                                                 colors: [
//                                                     Colors.grey.shade400,
//                                                     Colors.grey.shade900
//                                                   ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight),
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: size == 1
//                                             ? Border.all(
//                                                 color:
//                                                     detailsselectedindexbordercolor,
//                                                 width: 2)
//                                             : Border.all(
//                                                 color:
//                                                     detailsUnselectedindexbordercolor,
//                                                 width: 1)),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "Small",
//                                           style: TextStyle(
//                                               color: size == 0
//                                                   ? detailsboxcolor
//                                                   : detailsaddtocartbuttoncolor,
//                                               fontSize: 17,
//                                               fontWeight: size == 0
//                                                   ? FontWeight.w500
//                                                   : FontWeight.w800),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),

//                                 //medium
//                                 GestureDetector(
//                                   onTap: () {
//                                     price = size == 0
//                                         ? price
//                                         : size == 1
//                                             ? price / 2
//                                             : price / 3;
//                                     size = 1;
//                                     price = price * (size + 1);
//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                     height: 40,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         gradient: size == 1
//                                             ? LinearGradient(
//                                                 colors: [
//                                                     Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     Color.fromARGB(
//                                                         255, 61, 62, 65),
//                                                   ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight)
//                                             : LinearGradient(
//                                                 colors: [
//                                                     Colors.grey.shade400,
//                                                     Colors.grey.shade900
//                                                   ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight),
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: size == 1
//                                             ? Border.all(
//                                                 color:
//                                                     detailsselectedindexbordercolor,
//                                                 width: 2)
//                                             : Border.all(
//                                                 color:
//                                                     detailsUnselectedindexbordercolor,
//                                                 width: 1)),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "Medium",
//                                           style: TextStyle(
//                                               color: size == 1
//                                                   ? detailsboxcolor
//                                                   : detailsaddtocartbuttoncolor,
//                                               fontSize: 17,
//                                               fontWeight: size == 1
//                                                   ? FontWeight.w500
//                                                   : FontWeight.w800),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 //large
//                                 GestureDetector(
//                                   onTap: () {
//                                     price = size == 0
//                                         ? price
//                                         : size == 1
//                                             ? price / 2
//                                             : price / 3;
//                                     size = 2;
//                                     price = price * (size + 1);
//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                     height: 40,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         gradient: size == 2
//                                             ? LinearGradient(
//                                                 colors: [
//                                                     Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     Color.fromARGB(
//                                                         255, 61, 62, 65),
//                                                   ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight)
//                                             : LinearGradient(
//                                                 colors: [
//                                                     Colors.grey.shade400,
//                                                     Colors.grey.shade900
//                                                   ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight),
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: size == 2
//                                             ? Border.all(
//                                                 color:
//                                                     detailsselectedindexbordercolor,
//                                                 width: 2)
//                                             : Border.all(
//                                                 color:
//                                                     detailsUnselectedindexbordercolor,
//                                                 width: 1)),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "Large",
//                                           style: TextStyle(
//                                               color: size == 2
//                                                   ? detailsboxcolor
//                                                   : detailsaddtocartbuttoncolor,
//                                               fontSize: 17,
//                                               fontWeight: size == 2
//                                                   ? FontWeight.w500
//                                                   : FontWeight.w800),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           //addons
//                           Expanded(
//                             child: Container(
//                                 height: 180,
//                                 margin: EdgeInsets.fromLTRB(7, 7, 7, 1),
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   itemCount: addonlist.length,
//                                   itemBuilder: (context, index) {
//                                     var addon = addonlist[index];
//                                     String addonsName = addon.addonsName;
//                                     double price = addon.price as double;
//                                     return Padding(
//                                       padding: const EdgeInsets.only(
//                                           bottom: 11, left: 8, right: 8),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             if (addonindex == index) {
//                                               addonindex = -1;
//                                               addonprice = 0.0;
//                                             } else {
//                                               addonindex = index;
//                                               addonprice = price;
//                                             }
//                                           });
//                                         },
//                                         child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 13, horizontal: 18),
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               gradient: addonprice == price
//                                                   ? LinearGradient(
//                                                       colors: [
//                                                           Color.fromARGB(
//                                                               255, 17, 17, 19),
//                                                           Color.fromARGB(
//                                                               255, 17, 17, 19),
//                                                           Color.fromARGB(
//                                                               255, 78, 79, 82),
//                                                         ],
//                                                       begin: Alignment.topLeft,
//                                                       end:
//                                                           Alignment.bottomRight)
//                                                   : LinearGradient(
//                                                       colors: [
//                                                           Colors.grey.shade500,
//                                                           Colors.grey.shade700,
//                                                           Colors.grey.shade900,
//                                                         ],
//                                                       begin: Alignment.topLeft,
//                                                       end: Alignment
//                                                           .bottomRight),
//                                               border: addonprice == price
//                                                   ? Border.all(
//                                                       color: Color.fromARGB(
//                                                           255, 17, 17, 19),
//                                                       width: 2)
//                                                   : Border.all(
//                                                       color:
//                                                           Colors.grey.shade800,
//                                                       width: 1)),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 addonsName,
//                                                 style: TextStyle(
//                                                   fontSize: 18,
//                                                   color: addonprice == price
//                                                       ? Colors.white
//                                                       : Colors.black,
//                                                   fontWeight:
//                                                       index == addonindex
//                                                           ? FontWeight.w500
//                                                           : FontWeight.w800,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 "\$ $price",
//                                                 style: TextStyle(
//                                                   fontSize: 17,
//                                                   color: addonprice == price
//                                                       ? Colors.white
//                                                       : Colors.black,
//                                                   fontWeight:
//                                                       addonprice == price
//                                                           ? FontWeight.w500
//                                                           : FontWeight.w800,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 )),
//                           ),
//                           // Column(
//                           //   mainAxisSize: MainAxisSize.min,
//                           //   children: [

//                           //     ListView.builder(
//                           //       shrinkWrap: true,
//                           //       physics: NeverScrollableScrollPhysics(),
//                           //       itemCount: 3,
//                           //       itemBuilder: (context, index) {
//                           //         var addon = addonlist[index];
//                           //         String addonsName = addon.addonsName;
//                           //         double price = addon.price as double;
//                           //         return Padding(
//                           //           padding: const EdgeInsets.only(
//                           //               bottom: 11, left: 8, right: 8),
//                           //           child: GestureDetector(
//                           //             onTap: () {
//                           //               setState(() {
//                           //                 if (addonindex == index) {
//                           //                   addonindex = -1;
//                           //                   addonprice = 0.0;
//                           //                 } else {
//                           //                   addonindex = index;
//                           //                   addonprice = price;
//                           //                 }
//                           //               });
//                           //             },
//                           //             child: Container(
//                           //               padding: EdgeInsets.symmetric(
//                           //                   vertical: 13, horizontal: 18),
//                           //               decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                   gradient: addonprice == price
//                           //                       ? LinearGradient(
//                           //                           colors: [
//                           //                               Color.fromARGB(
//                           //                                   255, 17, 17, 19),
//                           //                               Color.fromARGB(
//                           //                                   255, 17, 17, 19),
//                           //                               Color.fromARGB(
//                           //                                   255, 78, 79, 82),
//                           //                             ],
//                           //                           begin: Alignment.topLeft,
//                           //                           end: Alignment.bottomRight)
//                           //                       : LinearGradient(
//                           //                           colors: [
//                           //                               Colors.grey.shade500,
//                           //                               Colors.grey.shade700,
//                           //                               Colors.grey.shade900,
//                           //                             ],
//                           //                           begin: Alignment.topLeft,
//                           //                           end: Alignment.bottomRight),
//                           //                   border: addonprice == price
//                           //                       ? Border.all(
//                           //                           color: Color.fromARGB(
//                           //                               255, 17, 17, 19),
//                           //                           width: 2)
//                           //                       : Border.all(
//                           //                           color: Colors.grey.shade800,
//                           //                           width: 1)),
//                           //               child: Row(
//                           //                 mainAxisAlignment:
//                           //                     MainAxisAlignment.spaceBetween,
//                           //                 children: [
//                           //                   Text(
//                           //                     addonsName,
//                           //                     style: TextStyle(
//                           //                       fontSize: 18,
//                           //                       color: addonprice == price
//                           //                           ? Colors.white
//                           //                           : Colors.black,
//                           //                       fontWeight: index == addonindex
//                           //                           ? FontWeight.w500
//                           //                           : FontWeight.w800,
//                           //                     ),
//                           //                   ),
//                           //                   Text(
//                           //                     "\$ $price",
//                           //                     style: TextStyle(
//                           //                       fontSize: 17,
//                           //                       color: addonprice == price
//                           //                           ? Colors.white
//                           //                           : Colors.black,
//                           //                       fontWeight: addonprice == price
//                           //                           ? FontWeight.w500
//                           //                           : FontWeight.w800,
//                           //                     ),
//                           //                   ),
//                           //                 ],
//                           //               ),
//                           //             ),
//                           //           ),
//                           //         );
//                           //       },
//                           //     )
//                           //   ],
//                           // ),
//                           ElevatedButton(
//                             onPressed: () {
//                               ref.read(CartProvider.notifier).update({
//                                 "name": itemdata["name"],
//                                 "size": size,
//                                 "quantity": quantity,
//                                 "addonprice": addonprice,
//                                 "price":
//                                     double.parse((price).toStringAsFixed(2)),
//                                 "cost": double.parse(
//                                     ((price * quantity) + addonprice)
//                                         .toStringAsFixed(2)),
//                               });
//                               Navigator.of(context).pop();
//                             },
//                             style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(
//                                   bottomsheetElevatedButtonBackgroundColor,
//                                 ),
//                                 shape: MaterialStateProperty.all(
//                                     RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16),
//                                 )),
//                                 fixedSize:
//                                     MaterialStateProperty.all(Size(380, 50))),
//                             child: Text(
//                               "Confirm",
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                   color: detailsboxcolor),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Positioned(
//                   //     top: -18,
//                   //     right: 8,
//                   //     child: IconButton(
//                   //         onPressed: () {
//                   //           Navigator.of(context).pop();
//                   //         },
//                   //         icon: Icon(
//                   //           Icons.cancel,
//                   //           size: 50,
//                   //           color: Colors.white,
//                   //         ))),
//                 ]),
//               );
//             }),
//             // Positioned(
//             //     top: -18,
//             //     right: 8,
//             //     child: IconButton(
//             //         onPressed: () {
//             //           Navigator.of(context).pop();
//             //         },
//             //         icon: Icon(
//             //           Icons.cancel,
//             //           size: 50,
//             //           color: Colors.white,
//             //         ))),
//           ]);
//         });
//   }
// }
}
