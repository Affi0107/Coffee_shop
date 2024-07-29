import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/cart/screen/Extras.dart';
import 'package:project_2/cart/widget/Bottom.dart';
import 'package:project_2/cart/widget/Cooking_Instructions.dart';
import 'package:project_2/cart/widget/cargo_cart_item.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../homepage/reusable_widgets/background_container_widget.dart';
import '../riverpod/state_provider.dart';

import '../widget/cart_item.dart';

import 'empty_cart.dart';

class Cargocart extends ConsumerStatefulWidget {
  Cargocart({super.key});

  @override
  ConsumerState<Cargocart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cargocart> {
  var pop = false;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(CargoProvider);

    final tipfee = ref.watch(TipProvider)["tip"];

    final tc = data.length != 0 ? data.map((e) => e["cost"] * 1).toList() : [];

    final subt =
        tc.length != 0 ? tc.reduce((value, element) => value + element) : 0;
    final gst = subt * 0.05;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          // backgroundColor: Colors.grey[100],
          appBar: AppbarWidget(
            incart: true,
          ),
          backgroundColor: Color.fromARGB(255, 37, 34, 34),
          drawer: DrawerScreen(),
          resizeToAvoidBottomInset: false,
          body: (subt == 0 || data.length == 0)
              //empty cart page
              ? BackgroundContainerWidget(child: EmptyCart())
              //cart page
              : BackgroundContainerWidget(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length + 2,
                                  padding: EdgeInsets.all(8),
                                  itemBuilder: (context, index) {
                                    if (index < data.length) {
                                      if (data[index]["quantity"] != 0) {
                                        return CargoCartitem(
                                            key: GlobalObjectKey(data[index]),
                                            data: data[index]);
                                      }
                                      return Container(
                                        height: 0,
                                      );
                                    } else if (index == data.length) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Extras(
                                            coffee: false,
                                          ),
                                        ],
                                      );
                                      // return Extras();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                      //total cost review widget
                      Bottom(
                        coffee: false,
                        gst: gst,
                        subtotal: subt,
                        tip: tipfee,
                      )
                    ],
                  ),
                )),
    );
  }
}
