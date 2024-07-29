// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/cart/screen/Extras.dart';
import 'package:project_2/cart/widget/Bottom.dart';
import 'package:project_2/cart/widget/Cooking_Instructions.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../appbar/custom_appbar_widget.dart';
import '../../homepage/reusable_widgets/background_container_widget.dart';
import '../riverpod/state_provider.dart';

import '../widget/cart_item.dart';

import 'empty_cart.dart';

class Cart extends ConsumerStatefulWidget {
  Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var pop = false;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(CartProvider);

    final tipfee = ref.watch(TipProvider)["tip"];

    final tc = data.length != 0 ? data.map((e) => e["cost"] * 1).toList() : [];

    final subt =
        tc.length != 0 ? tc.reduce((value, element) => value + element) : 0.0;
    final gst = subt * 0.05;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          drawer: DrawerScreen(),
          resizeToAvoidBottomInset: false,
          body: BackgroundContainerWidget(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    CustomAppbarWidget(
                      scaffoldKey: _scaffoldKey,
                      incart: true,
                    ),
                    (subt == 0 || data.length == 0)
                        ? EmptyCart()
                        : Positioned(
                            top: 90,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Container(
                                    height: 530,
                                    child: ListView(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: data.length + 3,
                                            padding: EdgeInsets.all(8),
                                            itemBuilder: (context, index) {
                                              if (index < data.length) {
                                                if (data[index]["quantity"] !=
                                                    0) {
                                                  return CartItem(
                                                      coffee: true,
                                                      key: GlobalObjectKey(
                                                          data[index]),
                                                      data: data[index]);
                                                }
                                                return Container(
                                                  height: 0,
                                                );
                                              } else if (index == data.length) {
                                                return CookingInstructions();
                                              } else if (index ==
                                                  data.length + 1) {
                                                return Extras(
                                                  coffee: true,
                                                );
                                                // return Extras();
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                                  //total cost review widget
                                ],
                              ),
                            ),
                          ),
                    (subt == 0 || data.length == 0)
                        ? SizedBox()
                        : Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Bottom(
                                coffee: true,
                                gst: gst,
                                subtotal: subt,
                                tip: tipfee,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
