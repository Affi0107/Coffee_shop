// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/widget/Cargoextraitems.dart';

import 'package:project_2/cart/widget/extraitems.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import 'package:project_2/homepage/model/cargo_json_model.dart';
import 'package:project_2/homepage/model/json_model.dart';

// import 'package:project_2/hjc/cart_widget/extraitems.dart';
class Extras extends ConsumerStatefulWidget {
  Extras({super.key, required this.coffee});
  final coffee;
  @override
  ConsumerState<Extras> createState() => ExtrasState();
}

class ExtrasState extends ConsumerState<Extras> {
  List<dynamic> data2 = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (widget.coffee == true) {
        final data = ref.watch(CartProvider);
        print("ppppppp  $data");
        var a = false; //snacks
        var b = false; //coffee
        var c = false; //cookies

        for (int i = 0; i < data.length; i++) {
          if (data[i]["category"] == "Snacks") {
            a = true;
          } else if (data[i]["category"] == "Coffee") {
            b = true;
          } else if (data[i]["category"] == "Drinks") {
            c = true;
          }
        }

        if (b || (b && a) || (b && a && c) || (b && c) || (a && c)) {
          fetchCookies();
        } else {
          fetchDrinks();
        }
      } else {
        final data = ref.watch(CargoProvider);
        var a = false; //Men
        var b = false; //Women
        print(data);
        for (int i = 0; i < data.length; i++) {
          if (data[i]["category"] == "ladies") {
            b = true;
          } else {
            a = true;
          }
        }

        if (a == true && b == false) {
          fetchMaccessories();
        } else if (a == false && b == true) {
          fetchWaccessorie();
        } else {
          fetchMWaccessories();
        }
      }
    });
  }

  Future<void> fetchWaccessorie() async {
    data2 = await ApiService.fetchLadiesAccessoriesData();
    setState(() {});
  }

  Future<void> fetchMaccessories() async {
    data2 = await ApiService.fetchMenAccessoriesData();

    setState(() {});
  }

  Future<void> fetchMWaccessories() async {
    data2 = await ApiService.fetchAccessoriesCombination();
    print("llll $data2");

    setState(() {});
  }

  Future<void> fetchCookies() async {
    data2 = await ApiService.fetchCookiesData();
    setState(() {});
  }

  Future<void> fetchDrinks() async {
    data2 = await ApiService.fetchCoffeeData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("44444444  $data2");
    print("aaaaaaaaaa ${widget.coffee}");
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            // color: Color.fromARGB(255, 240, 70, 58),
            borderRadius: BorderRadius.circular(5)),
        // height: 180,
        child: widget.coffee == false
            ? CargoExtraItems(data: data2)
            : ExtraItems(data: data2));
  }
}
