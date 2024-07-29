// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/riverpod/state_provider.dart';

import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/model/json_model.dart';

class ExtraItems extends ConsumerWidget {
  ExtraItems({required this.data, this.coffee = true});

  final coffee;
  final List<dynamic> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("aaaaa $data  $coffee");
    final func = ref.watch(CartProvider.notifier);
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
              final List addons = fetchProduct.addons;
              final addon1 = addons
                  .map((e) => {"addonsName": e.addonsName, "price": e.price})
                  .toList();
              final totalRating = fetchProduct.totalRatings;
              final rating = fetchProduct.rating;
              final offerPrice = fetchProduct.offerPrice;
              final discount = fetchProduct.discount;
              final category = fetchProduct.category;
              // print("extraaaa  ${data[index]}");
              return InkWell(
                onTap: () {
                  func.additem({
                    "addons": addons,
                    "category": category,
                    "addonprice": 0.0,
                    "name": name,
                    "image": "assets/images/$image.jpg",
                    "cost": offerPrice,
                    "price": offerPrice,
                    "quantity": 1,
                    "size": 0
                  });
                },
                // onTap: () => Navigator.pushNamed(context, widget.nextPage,
                //     arguments: fetchProduct),
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
                                    "assets/images/$image.jpg",
                                    fit: BoxFit.fill,
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

    // Card(
    //   // elevation: 0,
    //   color: extraitemcardcolor,
    //   child: Padding(
    //     padding: EdgeInsets.only(bottom: 3),
    //     child: Container(
    //       padding: EdgeInsets.all(8.0),
    //       height: 117,
    //       width: 280,
    //       margin: EdgeInsets.symmetric(horizontal: 2),
    //       decoration: BoxDecoration(
    //           //     color: extraitemcardboxdecolor,
    //           gradient:
    //               LinearGradient(colors: [extraitemcolor1, extraitemcolor2]),
    //           borderRadius: BorderRadius.circular(15),
    //           boxShadow: [
    //             BoxShadow(
    //               color: extraitemcardboxshadowcolor,
    //               spreadRadius: 2,
    //               blurRadius: 3,
    //               offset: Offset(0, 3),
    //             )
    //           ]),
    //       child: Row(
    //         children: [
    //           Container(
    //             width: 113,
    //             height: 124,
    //             decoration: BoxDecoration(
    //               boxShadow: [
    //                 BoxShadow(
    //                     color: extraitemcolor3,
    //                     spreadRadius: 1.5,
    //                     blurRadius: 2),
    //               ],
    //               borderRadius: BorderRadius.circular(90),
    //               image: DecorationImage(
    //                   fit: BoxFit.cover, image: AssetImage(image)),
    //             ),
    //           ),
    //           SizedBox(width: 15),
    //           Container(
    //             width: 125,
    //             // color: Colors.grey,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   name,
    //                   style: TextStyle(
    //                       color: cartbuttoncolor,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 20),
    //                 ),
    //                 Text(
    //                   extraslogan,
    //                   maxLines: 2,
    //                   style: TextStyle(
    //                     color: cartbuttoncolor,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 12.7,
    //                   ),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       "\$ $price",
    //                       style: TextStyle(
    //                         fontSize: 17,
    //                         color: extraitempricetextcolor,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     MouseRegion(
    //                       cursor: SystemMouseCursors.click,
    //                       child: IconButton(
    //                         mouseCursor: SystemMouseCursors.grab,
    //                         onPressed: () {
    //                           coffee == true
    //                               ? ref.watch(CartProvider.notifier).additem({
    //                                   "name": name,
    //                                   "image": image,
    //                                   "price": price,
    //                                   "cost": price,
    //                                   "quantity": 1
    //                                 })
    //                               : ref.watch(CargoProvider.notifier).additem({
    //                                   "name": name,
    //                                   "image": image,
    //                                   "cost": price,
    //                                   "price": price,
    //                                   "quantity": 1
    //                                 });
    //                         },
    //                         icon: Icon(
    //                           Icons.shopping_cart_outlined,
    //                           color: extraitemshoppingcartoutlinecolor,
    //                           size: 25,
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
