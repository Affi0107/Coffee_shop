// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/riverpod/state_provider.dart';

import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/model/json_model.dart';

class CargoExtraItems extends ConsumerWidget {
  CargoExtraItems({required this.data, this.coffee = false});

  final coffee;
  final List<dynamic> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("aaaaa $data");
    final func = ref.read(CargoProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          suggestionText,
          style: TextStyle(
              color: suggestionTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          height: 190,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 5, mainAxisExtent: 160),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var fetchProduct = data[index];
              final image = fetchProduct.image;
              final name = fetchProduct.name;
              final totalRating = fetchProduct.totalRatings;
              final rating = fetchProduct.rating;
              final offerPrice = fetchProduct.offerPrice;
              final discount = fetchProduct.discount;
              final category = fetchProduct.category;
              print("$category 333333 $image");
              final path = category == "ladies_accessories"
                  ? "assets/images/LadiesBag/ladies_accessories/$image.png"
                  : "assets/images/MenShoes/men_accessories/$image.png";

              return InkWell(
                onTap: () {
                  func.additem({
                    "name": name,
                    "image": path,
                    "price": offerPrice,
                    "cost": offerPrice,
                    "quantity": 1,
                    "category": "extras",
                    "size": -1
                  });
                },
                child: Card(
                    // elevation: 10,
                    // shadowColor: suggestionCardShadowColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: const [
                                Colors.black,
                                Color.fromARGB(255, 17, 17, 19),
                                Color.fromARGB(255, 50, 51, 53)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Hero(
                                  tag: fetchProduct,
                                  child: Image.asset(
                                    category == "ladies_accessories"
                                        ? "assets/images/LadiesBag/ladies_accessories/$image.png"
                                        : "assets/images/MenShoes/men_accessories/$image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 17,
                                        color: suggestionCardIconColor,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "$rating ($totalRating)",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 221, 221, 221),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$ $offerPrice ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "($discount% Off)",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: suggestionCardDiscountColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}
