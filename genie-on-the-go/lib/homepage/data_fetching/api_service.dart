// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_2/homepage/model/cargo_json_model.dart';
import '../model/json_model.dart';

class ApiService {
  static fetchOffersData() async {
    final String data = await rootBundle.loadString('assets/json/offers.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchPopularData() async {
    final String data = await rootBundle.loadString('assets/json/popular.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchCoffeeData() async {
    final String data = await rootBundle.loadString('assets/json/coffee.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchSnacksData() async {
    final String data = await rootBundle.loadString('assets/json/snacks.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchCookiesData() async {
    final String data = await rootBundle.loadString('assets/json/cookies.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchMenShoesData() async {
    final String data =
        await rootBundle.loadString('assets/json/men/shoes.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => CargoJsonModel.fromJson(e)).toList();
  }

  static fetchMenAccessoriesData() async {
    final String data =
        await rootBundle.loadString('assets/json/men/men_accessories.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => CargoJsonModel.fromJson(e)).toList();
  }

  static fetchLadiesBagData() async {
    final String data =
        await rootBundle.loadString('assets/json/ladies/ladies.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => CargoJsonModel.fromJson(e)).toList();
  }

  static fetchLadiesAccessoriesData() async {
    final String data = await rootBundle
        .loadString('assets/json/ladies/ladies_accessories.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => CargoJsonModel.fromJson(e)).toList();
  }

  static fetchAccessoriesCombination() async {
    final String data = await rootBundle
        .loadString('assets/json/ladies/accessories_combination.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => CargoJsonModel.fromJson(e)).toList();
  }
}
