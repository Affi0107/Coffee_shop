import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/widget/Remove_or_Cancel.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class CargoCartitem extends ConsumerStatefulWidget {
  const CargoCartitem({super.key, required this.data, this.atpayment = false});
  final data;
  final atpayment;
  @override
  ConsumerState<CargoCartitem> createState() => _CargoCartitemState();
}

class _CargoCartitemState extends ConsumerState<CargoCartitem> {
  var _showremove = false;

  @override
  Widget build(BuildContext context) {
    print("llllllll ${widget.data}");
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
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: addon == null ? 130 : 145,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Color.fromARGB(
                      //     255, 17, 16, 16), // Color.fromARGB(255, 247, 235, 231),
                      gradient: LinearGradient(colors: [
                        cartLinearGrad1,
                        cartLinearGrad2,
                        cartLinearGrad3
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: cartboxshadow1,
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
                                color: cartboxshadow2,
                                offset: Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),

                        //2nd widget
                        Expanded(
                          child: Container(
                            //   color: Colors.green,
                            width: 97,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // ${addon == null ? "" : "with ${addon}"}
                                      "${widget.data["name"]}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: cartbuttoncolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    SizedBox(
                                      height: addon == null ? 35 : 12,
                                    ),
                                    (widget.data["category"] == "extras" ||
                                            widget.data["category"] == "ladies")
                                        ? SizedBox()
                                        : Text(
                                            "Size : ${widget.data["size"]}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          )
                                  ],
                                ),
                                Text(
                                  "\$ $amount2",
                                  style: TextStyle(
                                    color: cartbuttoncolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                // addon == null
                                //     ? SizedBox()
                                //     : Text(
                                //         "  with ${addon}",
                                //         style: TextStyle(
                                //           color: cartbuttoncolor,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 16,
                                //         ),
                                //       ),

                                // addon == null
                                //     ? SizedBox()
                                //     : Text(
                                //         "Addon : $addon",
                                //         style: TextStyle(
                                //           color: cartbuttoncolor,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 16,
                                //         ),
                                //       ),
                              ],
                            ),
                          ),
                        ),
                        //         showremove
                        // //             ? remove
                        SizedBox(
                          width: 3,
                        ),

                        widget.atpayment
                            ? Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        quantity,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${widget.data["quantity"]}",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                // color: Colors.red,
                                child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 35,
                                        decoration: BoxDecoration(

                                            //  color: Color.fromARGB(255, 19, 18, 18),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: IconButton(
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            color: carticonbutton,
                                            onPressed: () {
                                              if (widget.data["quantity"] ==
                                                  1) {
                                                setState(() {
                                                  _showremove = true;
                                                });
                                              } else {
                                                ref
                                                    .watch(
                                                        CargoProvider.notifier)
                                                    .decrease_quantity(
                                                        widget.data["name"]);
                                                ;
                                              }
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 22,
                                            )),
                                      ),
                                      Container(
                                        //  color: Colors.red,
                                        height: 30,
                                        padding:
                                            EdgeInsets.fromLTRB(8, 6.8, 8, 0),
                                        child: Text(
                                          widget.data["quantity"].toString(),
                                          style: TextStyle(
                                              color: cartbuttoncolor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: IconButton(
                                            color: carticonbutton,
                                            onPressed: () {
                                              ref
                                                  .watch(CargoProvider.notifier)
                                                  .increase_quantity(
                                                      widget.data["name"], 1);
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 22,
                                            )),
                                      ),
                                    ],
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        ref
                                            .read(CargoProvider.notifier)
                                            .remove_item(widget.data["name"]);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        color: cartdeletebutton,
                                        Icons.delete,
                                        size: 28,
                                      ))
                                  // showremove
                                  //     ? remove
                                ],
                              )),
                      ]),
                ),
                (widget.data["category"] == "extras" ||
                        widget.data["category"] == "ladies")
                    ? SizedBox()
                    : Positioned(
                        top: -10,
                        right: -2,
                        child: TextButton.icon(
                            onPressed: () {
                              showmodal({
                                "size": widget.data["size"],
                                "image": widget.data["icon"],
                                "price": widget.data["price"],
                                "name": widget.data["name"],
                                "cost": widget.data["cost"],
                                "quantity": widget.data["quantity"],
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 15,
                              color: editButtonColor,
                            ),
                            label: Text(
                              editButtonName,
                              style: TextStyle(
                                fontSize: 15,
                                color: editButtonColor,
                              ),
                            ))),
              ]),
            ),
    );
  }

  showmodal(Map itemdata) {
    int quantity = itemdata["quantity"];
    double cost = itemdata["cost"];
    int size = itemdata["size"];

    List sizes = [5, 6, 7, 8, 9, 10, 11, 12, 13];
    var sizeind = size - 5;

    double price = itemdata["price"];
    // size==0?price:size==1?price/2:price/3;

    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Stack(children: [
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Positioned(
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 32, 26, 26)),
                    padding: EdgeInsets.all(10),
                    height: 300,
                    // width: 23,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //first widget
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Color.fromARGB(
                                //     255, 17, 16, 16), // Color.fromARGB(255, 247, 235, 231),
                                gradient: LinearGradient(
                                    colors: [
                                      cartLinearGrad1,
                                      cartLinearGrad2,
                                      Color.fromARGB(255, 90, 92, 95)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: cartboxshadow1,
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 105,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(itemdata["image"]),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: cartboxshadow2,
                                          offset: Offset(0, 2),
                                          blurRadius: 2,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            itemdata["name"],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: cartbuttoncolor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "\$ ${((price * quantity)).toStringAsFixed(2)}",
                                            style: TextStyle(
                                              color: cartbuttoncolor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Size : ${size == 0 ? "Small" : size == 1 ? "Medium" : "Large"}",
                                              //   style: TextStyle(
                                              //       color: Colors.white),
                                              // ),
                                              sizeind != -1
                                                  ? Text(
                                                      "Size : ${size}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  : SizedBox()
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  //         showremove
                                  // //             ? remove
                                  SizedBox(
                                    width: 10,
                                  ),

                                  Container(
                                      child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                //   color: Color.fromARGB(255, 19, 18, 18),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: IconButton(
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                color: carticonbutton,
                                                onPressed: () {
                                                  quantity = quantity - 1 <= 0
                                                      ? 1
                                                      : quantity - 1;
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 22,
                                                )),
                                          ),
                                          Container(
                                            //  color: Colors.red,
                                            height: 30,
                                            padding: EdgeInsets.fromLTRB(
                                                8, 6.8, 8, 0),
                                            child: Text(
                                              "${quantity}",
                                              style: TextStyle(
                                                  color: cartbuttoncolor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: IconButton(
                                                color: carticonbutton,
                                                onPressed: () {
                                                  quantity = quantity + 1;
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 22,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                                ]),
                          ),
                        )
                        //for 2nd widget------------------------------------------------------------
                        ,
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            "Size",
                            style: TextStyle(
                                color: detailstextcolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: 7, right: 7, top: 9, bottom: 12),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: sizes.map((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      price = price / ((size - 5) + 1);

                                      size = e;
                                      price = price * (e - 5 + 1);

                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 60,
                                      margin: EdgeInsets.only(left: 8),
                                      decoration: BoxDecoration(
                                          gradient: size == e
                                              ? LinearGradient(
                                                  colors: [
                                                      Color.fromARGB(
                                                          255, 17, 17, 19),
                                                      Color.fromARGB(
                                                          255, 17, 17, 19),
                                                      Color.fromARGB(
                                                          255, 61, 62, 65),
                                                    ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight)
                                              : LinearGradient(
                                                  colors: [
                                                      Colors.grey.shade400,
                                                      Colors.grey.shade900
                                                    ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: size == e
                                              ? Border.all(
                                                  color:
                                                      detailsselectedindexbordercolor,
                                                  width: 2)
                                              : Border.all(
                                                  color:
                                                      detailsUnselectedindexbordercolor,
                                                  width: 1)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "$e",
                                            style: TextStyle(
                                                color: size == e
                                                    ? detailsboxcolor
                                                    : detailsaddtocartbuttoncolor,
                                                fontSize: 17,
                                                fontWeight: size == e
                                                    ? FontWeight.w500
                                                    : FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList()),
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            ref.read(CargoProvider.notifier).update({
                              "name": itemdata["name"],
                              "size": size,
                              "quantity": quantity,
                              "price": double.parse((price).toStringAsFixed(2)),
                              "cost": double.parse(
                                  ((price * quantity)).toStringAsFixed(2)),
                              "size": size
                            });
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                bottomsheetElevatedButtonBackgroundColor,
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                              fixedSize:
                                  MaterialStateProperty.all(Size(380, 50))),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: detailsboxcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ]);
        });
  }
}
