// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/payments/payment_app.dart';
import 'package:readmore/readmore.dart';
import '../../appbar/custom_appbar_widget.dart';
import '../../constants/text_constants.dart';
import 'addon_box.dart';
import 'background_container_widget.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPageWidget extends ConsumerStatefulWidget {
  const DetailsPageWidget({
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
  ConsumerState<DetailsPageWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPageWidget> {
  int selectedIndex = 0;
  int quantity = 1;
  double addonprice = 0.0;

  List<AddonModel> addons = [];
  late var offerPrice;
  //late var offerPrice2;

  @override
  void initState() {
    super.initState();
    //  offerPrice2 = widget.details.offerPrice;
    offerPrice = widget.details.offerPrice;
  }

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height;
    final bodyWidth = MediaQuery.of(context).size.width;
    final cateogry = widget.details.category;
    //  print(cateogry);
    final name = widget.details.name;
    final func = ref.read(CartProvider.notifier);
    final image = widget.details.image;

    final description = widget.details.description;

    final price1 = selectedIndex == 0
        ? widget.details.price
        : selectedIndex == 1
            ? double.parse((widget.details.price * 2).toStringAsFixed(2))
            : double.parse((widget.details.price * 3).toStringAsFixed(2));

    final price = double.parse((quantity * price1).toStringAsFixed(2));

    final offerPrice1 = selectedIndex == 0
        ? offerPrice
        : selectedIndex == 1
            ? double.parse((offerPrice * 2).toStringAsFixed(2))
            : double.parse((offerPrice * 3).toStringAsFixed(2));

    var offerPrice2 = quantity * offerPrice1;
    offerPrice2 = double.parse((offerPrice2 + addonprice).toStringAsFixed(2));

    final discount = widget.details.discount;
    final rating = widget.details.rating;
    final totalRatings = widget.details.totalRatings;
    final sizeName1 = widget.details.size.sizeName1;
    final sizeName2 = widget.details.size.sizeName2;
    final sizeName3 = widget.details.size.sizeName3;

    addons = widget.details.addons;
    //   print(addons);

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
                            image: AssetImage("assets/images/$image.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              CustomAppbarWidget(
                scaffoldKey: widget.scaffoldKey,
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
                    color: detailsglasscontainercolor,
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
                                    color: detailsproductnamecolor,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: detailsratingstarcolor,
                                      size: 23,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      rating,
                                      style: TextStyle(
                                          color: detailsratingcolor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '($totalRatings)',
                                      style: TextStyle(
                                          color: detailstotalratingscolor,
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
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: detailsboxdecorationcolor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\$ $offerPrice2",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: detailsboxcolor),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$ $price ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: detailspricefontcolor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    detailspriceboxdecorationcolor,
                                                decorationThickness: 2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "($discount% Off)",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: detailsdiscountboxcolor,
                                            ),
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
                                          color: detailsboxdecoration1color),
                                      child: IconButton(
                                        color: detailsiconbuttoncolor,
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
                                          color: detailsboxdecoration2color),
                                      child: IconButton(
                                        color: detailsiconbuttoncolor,
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
                      // color: Colors.green,
                      child: ListView(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 0),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detaildescription,
                                style: TextStyle(
                                    color: detailstextcolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: bodyWidth - 30,
                                child: ReadMoreText(
                                  description,
                                  style: TextStyle(
                                    color: detailscolor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  moreStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: detailsreadmoreshowelesscolor),
                                  lessStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: detailsreadmoreshowelesscolor),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                size,
                                style: TextStyle(
                                    color: detailstextcolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: bodyWidth,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildSizeButton(sizeName1, 0, "(354 ML)"),
                                    _buildSizeButton(sizeName2, 1, "(473 ML)"),
                                    _buildSizeButton(sizeName3, 2, "(591 ML)")
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: detailsAddonsStarIconColor,
                                      size: 25),
                                  SizedBox(width: 5),
                                  Text(
                                    addonText,
                                    style: TextStyle(
                                        color: detailstextcolor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              AddonBox(
                                  addons: addons,
                                  onAddonSelectionChanged:
                                      (double priceChange) {
                                    setState(() {
                                      addonprice = priceChange;
                                    });
                                  }),
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
                              "addons": addons,
                              "category": cateogry,
                              "addonprice": addonprice,
                              "name": name,
                              "image": "assets/images/$image.jpg",
                              "cost": offerPrice2,
                              "price": offerPrice1,
                              "quantity": quantity,
                              "size": selectedIndex
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentApp(
                                          coffee: true,
                                          checkout: true,
                                        )));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 173, 86, 31),
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                              fixedSize: MaterialStateProperty.all(
                                  Size((bodyWidth / 3) + 25, 50))),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: detailsshoppingbagcolor,
                            size: 22,
                          ),
                          label: Text(
                            buynow,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: detailsboxcolor),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            func.additem({
                              "addons": addons,
                              "category": cateogry,
                              "addonprice": addonprice,
                              "name": name,
                              "image": "assets/images/$image.jpg",
                              "cost": offerPrice2,
                              "price": offerPrice1,
                              "quantity": quantity,
                              "size": selectedIndex
                            });
                            bottomSheet();
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: detailsshoppingcartcolor,
                            size: 20,
                          ),
                          label: Text(
                            addtocart,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 117, 31),
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              fixedSize: MaterialStateProperty.all(
                                  Size((bodyWidth / 3) + 25, 50)),
                              side: MaterialStatePropertyAll(BorderSide(
                                color: Color.fromARGB(255, 173, 86, 31),
                                // color: Color.fromARGB(255, 163, 63, 1),
                                width: 3,
                              ))),
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

  Widget _buildSizeButton(
    String title,
    int index,
    String sizename,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: widget.details.category == snacks
            ? 43
            : widget.details.category == cookies
                ? 43
                : 52,
        width: widget.details.category == snacks
            ? 105
            : widget.details.category == cookies
                ? 105
                : 110,
        decoration: BoxDecoration(
            gradient: index == selectedIndex
                ? LinearGradient(colors: [
                    Color.fromARGB(255, 17, 17, 19),
                    Color.fromARGB(255, 17, 17, 19),
                    Color.fromARGB(255, 61, 62, 65),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                : LinearGradient(
                    colors: [Colors.grey.shade400, Colors.grey.shade900],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
            border: index == selectedIndex
                ? Border.all(color: detailsselectedindexbordercolor, width: 2)
                : Border.all(
                    color: detailsUnselectedindexbordercolor, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: index == selectedIndex
                      ? detailsboxcolor
                      : detailsaddtocartbuttoncolor,
                  fontSize: 17.5,
                  fontWeight: index == selectedIndex
                      ? FontWeight.w500
                      : FontWeight.w800),
            ),
            if (widget.details.category == "Coffee")
              Text(
                sizename,
                style: TextStyle(
                    color: index == selectedIndex
                        ? detailsboxcolor
                        : detailsaddtocartbuttoncolor,
                    fontSize: 12,
                    fontWeight: index == selectedIndex
                        ? FontWeight.normal
                        : FontWeight.w800),
              ),
          ],
        ),
      ),
    );
  }

  Future bottomSheet() {
    return showModalBottomSheet(
      // backgroundColor: Color.fromARGB(255, 57, 58, 59),
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
                color: detailsbottomsheetboxcolor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  color: detailstextcolor,
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
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          size: 35,
                          color: detailsdoneiconcolor,
                        ),
                        SizedBox(width: 15),
                        Row(
                          children: [
                            Text(
                              "${widget.details.name} ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              cartconfirmationmsg,
                              style: TextStyle(
                                  fontSize: 19.5,
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
                            Navigator.pushNamed(context, '/cart');
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: detailsshoppingcartcolor,
                            size: 21,
                          ),
                          label: Text(
                            cart,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: bottomsheetOutlinedButtonTextColor),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              fixedSize:
                                  MaterialStateProperty.all(Size(140, 50)),
                              side: MaterialStatePropertyAll(BorderSide(
                                  color:
                                      bottomsheetOutlinedButtonBackgroundColor,
                                  width: 3.5))),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/home');
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
                                  MaterialStateProperty.all(Size(230, 50))),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: detailsshoppingbagcolor,
                            size: 20,
                          ),
                          label: Text(
                            continueshopping,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: detailsboxcolor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
//   showmodal(Map itemdata) {
//     int quantity = itemdata["quantity"];
//     double cost = itemdata["cost"];
//     int size = itemdata["size"];
//     double addonprice = itemdata["addonprice"];
//     int addonindex = -1;
//     List addonlist = [
//       {"name": "Normal Milk", "price": 0.8},
//       {"name": "Oat Milk", "price": 1.2},
//       {"name": "Alomnd Milk", "price": 2.0}
//     ];

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
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 itemCount: 3,
//                                 itemBuilder: (context, index) {
//                                   var addon = addonlist[index];
//                                   String addonsName = addon["name"];
//                                   double price = addon["price"] as double;
//                                   return Padding(
//                                     padding: const EdgeInsets.only(
//                                         bottom: 11, left: 8, right: 8),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           if (addonindex == index) {
//                                             addonindex = -1;
//                                             addonprice = 0.0;
//                                           } else {
//                                             addonindex = index;
//                                             addonprice = price;
//                                           }
//                                         });
//                                       },
//                                       child: Container(
//                                         padding: EdgeInsets.symmetric(
//                                             vertical: 13, horizontal: 18),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             gradient: addonprice == price
//                                                 ? LinearGradient(
//                                                     colors: [
//                                                         Color.fromARGB(
//                                                             255, 17, 17, 19),
//                                                         Color.fromARGB(
//                                                             255, 17, 17, 19),
//                                                         Color.fromARGB(
//                                                             255, 78, 79, 82),
//                                                       ],
//                                                     begin: Alignment.topLeft,
//                                                     end: Alignment.bottomRight)
//                                                 : LinearGradient(
//                                                     colors: [
//                                                         Colors.grey.shade500,
//                                                         Colors.grey.shade700,
//                                                         Colors.grey.shade900,
//                                                       ],
//                                                     begin: Alignment.topLeft,
//                                                     end: Alignment.bottomRight),
//                                             border: addonprice == price
//                                                 ? Border.all(
//                                                     color: Color.fromARGB(
//                                                         255, 17, 17, 19),
//                                                     width: 2)
//                                                 : Border.all(
//                                                     color: Colors.grey.shade800,
//                                                     width: 1)),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               addonsName,
//                                               style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: addonprice == price
//                                                     ? Colors.white
//                                                     : Colors.black,
//                                                 fontWeight: index == addonindex
//                                                     ? FontWeight.w500
//                                                     : FontWeight.w800,
//                                               ),
//                                             ),
//                                             Text(
//                                               "\$ $price",
//                                               style: TextStyle(
//                                                 fontSize: 17,
//                                                 color: addonprice == price
//                                                     ? Colors.white
//                                                     : Colors.black,
//                                                 fontWeight: addonprice == price
//                                                     ? FontWeight.w500
//                                                     : FontWeight.w800,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               )
//                             ],
//                           ),
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
