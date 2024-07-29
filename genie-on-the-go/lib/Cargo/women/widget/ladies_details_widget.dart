// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../appbar/custom_appbar_widget.dart';
import '../../../cart/riverpod/cargo_state_provider.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';

class LadiesDetailsWidget extends ConsumerStatefulWidget {
  const LadiesDetailsWidget({
    super.key,
    required this.details,
    required this.fetchProducts,
    required this.nextPage,
    required this.scaffoldKey,
  });

  final details;
  final fetchProducts;
  final nextPage;
  final scaffoldKey;

  @override
  ConsumerState<LadiesDetailsWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<LadiesDetailsWidget> {
  int quantity = 1;
  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height;
    final bodyWidth = MediaQuery.of(context).size.width;

    final func = ref.read(CargoProvider.notifier);
    final image = widget.details.image;
    final name = widget.details.name;
    final description = widget.details.description;

    final price1 = widget.details.price;

    final price = double.parse((quantity * price1).toStringAsFixed(2));

    final offerPrice1 = widget.details.offerPrice;

    final offerPrice =
        double.parse((quantity * offerPrice1).toStringAsFixed(2));

    final discount = widget.details.discount;
    final rating = widget.details.rating;
    final totalRatings = widget.details.totalRatings;
    final category = widget.details.category;

    return BackgroundContainerWidget(
      child: SafeArea(
        child: Container(
          height: bodyHeight,
          width: bodyWidth,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Hero(
                  tag: widget.details,
                  child: Container(
                    height: (bodyHeight / 3) + 38,
                    width: bodyWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: category == "ladies"
                                ? AssetImage(
                                    "assets/images/LadiesBag/$image.jpg")
                                : AssetImage(
                                    "assets/images/LadiesBag/ladies_accessories/$image.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              CustomAppbarWidget(
                scaffoldKey: widget.scaffoldKey,
                coffee: false,
              ),
              Positioned(
                top: (bodyHeight / 4) + 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GlassContainer(
                    height: 120.0,
                    width: bodyWidth - 20,
                    blur: 5,
                    border: Border.fromBorderSide(BorderSide.none),
                    borderRadius: BorderRadius.circular(30.0),
                    color: glasscontainerColor,
                    child: Container(
                      width: bodyWidth - 20.0,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 25.0),
                            width: (bodyWidth - 20.0) / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: glasscontainerNameColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: glasscontainerStarIconColor,
                                      size: 23,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      rating,
                                      style: TextStyle(
                                          color: glasscontainerRatingColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '($totalRatings)',
                                      style: TextStyle(
                                          color: glasscontainerTotalratingColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 140,
                            width: (bodyWidth - 20) / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  height: 80,
                                  width: 167,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black.withOpacity(0.6)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\$ $offerPrice",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                glasscontainerOfferpriceColor),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$ $price ",
                                            style: TextStyle(
                                                // fontSize: 18,
                                                fontSize: 15,
                                                color: glasscontainerPriceColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    glasscontainerPriceDecorationColor,
                                                decorationThickness: 2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "($discount% Off)",
                                            style: TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    glasscontainerDiscountColor),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                //
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              glasscontainerRemoveIconDecorationColor),
                                      child: IconButton(
                                        color:
                                            glasscontainerRemoveIconButtonColor,
                                        onPressed: () {
                                          setState(() {
                                            quantity = quantity - 1 == 0
                                                ? 1
                                                : quantity - 1;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                    Text(quantity.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800)),
                                    Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              glasscontainerAddIconDecorationColor),
                                      child: IconButton(
                                        color: glasscontainerAddIconButtonColor,
                                        onPressed: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: bodyHeight / 2 - 65,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: bodyHeight / 2 - 48,
                      width: bodyWidth - 10,
                      child: ListView(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 0),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                descriptionText,
                                style: TextStyle(
                                    color: descriptiontextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: bodyWidth - 30,
                                child: ReadMoreText(
                                  description,
                                  style: TextStyle(
                                    color: descriptionColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  moreStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: descriptionMoreStyleColor),
                                  lessStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: descriptionLessStyleColor),
                                ),
                              ),
                              SizedBox(height: 22),
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
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisSpacing: 5,
                                          mainAxisExtent: 160),
                                  itemCount: widget.fetchProducts.length,
                                  itemBuilder: (context, index) {
                                    var fetchProduct =
                                        widget.fetchProducts[index];
                                    final image = fetchProduct.image;
                                    final name = fetchProduct.name;
                                    final totalRating =
                                        fetchProduct.totalRatings;
                                    final rating = fetchProduct.rating;
                                    final offerPrice = fetchProduct.offerPrice;
                                    final discount = fetchProduct.discount;

                                    return InkWell(
                                      onTap: () => Navigator.pushNamed(
                                          context, widget.nextPage,
                                          arguments: fetchProduct),
                                      child: Card(
                                          // elevation: 10,
                                          // shadowColor: suggestionCardShadowColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                    colors: const [
                                                      Colors.black,
                                                      Color.fromARGB(
                                                          255, 17, 17, 19),
                                                      Color.fromARGB(
                                                          255, 50, 51, 53)
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end:
                                                        Alignment.bottomRight)),
                                            child: Padding(
                                              padding: EdgeInsets.all(7),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Hero(
                                                        tag: fetchProduct,
                                                        child: Image.asset(
                                                          "assets/images/LadiesBag/ladies_accessories/$image.png",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, left: 3),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          name,
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size: 17,
                                                              color:
                                                                  suggestionCardIconColor,
                                                            ),
                                                            SizedBox(width: 3),
                                                            Text(
                                                              "$rating ($totalRating)",
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        221,
                                                                        221,
                                                                        221),
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Text(
                                                              "($discount% Off)",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      suggestionCardDiscountColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
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
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    width: bodyWidth - 10,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            func.additem({
                              "name": name,
                              "image": "assets/images/LadiesBag/$image.jpg",
                              "price": offerPrice1,
                              "cost": offerPrice1 * quantity,
                              "quantity": quantity,
                              "category": category,
                              "size": -1
                            });

                            Navigator.pushNamed(context, '/cargocart');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  elevatedButtonBackgroundColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                              fixedSize: MaterialStateProperty.all(
                                  Size((bodyWidth / 3) + 25, 50))),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: elevatedButtonIconColor,
                            size: 22,
                          ),
                          label: Text(
                            buttonName1,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: elevatedButtonTextColor),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            func.additem({
                              "name": name,
                              "image": "assets/images/LadiesBag/$image.jpg",
                              "price": offerPrice1,
                              "cost": offerPrice1 * quantity,
                              "quantity": quantity,
                              "category": category,
                              "size": -1
                            });

                            bottomSheet();
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: outlinedButtonIconColor,
                            size: 20,
                          ),
                          label: Text(
                            buttonName2,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: outlinedButtonTextColor),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              fixedSize: MaterialStateProperty.all(
                                  Size((bodyWidth / 3) + 25, 50)),
                              side: MaterialStatePropertyAll(BorderSide(
                                  color: outlinedButtonSideColor, width: 3))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future bottomSheet() {
    return showModalBottomSheet(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      enableDrag: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: bottomsheetContainerColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  color: bottomsheetDividerColor,
                  thickness: 3,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 13, 13, 13),
                  Color.fromARGB(255, 17, 17, 19),
                  Color.fromARGB(255, 43, 44, 46)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          size: 35,
                          color: bottomsheetDoneIconColor,
                        ),
                        SizedBox(width: 15),
                        Column(
                          children: [
                            Text(
                              "${widget.details.name} ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              maxLines: 2,
                            ),
                            Text(
                              buttomsheetText,
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 221, 221, 221)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/cargocart');
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: outlinedButtonShopping_cartIconColor,
                            size: 21,
                          ),
                          label: Text(
                            buttomsheetButtonName1,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: outlinedButton_TextColor),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              fixedSize:
                                  MaterialStateProperty.all(Size(140, 50)),
                              side: MaterialStatePropertyAll(BorderSide(
                                  color: outlinedButton_SideColor,
                                  width: 3.5))),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/bagpage');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  elevatedButton_BackgroundColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                              fixedSize:
                                  MaterialStateProperty.all(Size(230, 50))),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: elevatedButtonShopping_bagIconColor,
                            size: 20,
                          ),
                          label: Text(
                            buttomsheetButtonName2,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
