// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import '../../appbar/custom_appbar_widget.dart';
import '../../constants/color_constants.dart';
import '../../homepage/model/cargo_json_model.dart';

class MenShoe extends StatefulWidget {
  const MenShoe({super.key});

  @override
  State<MenShoe> createState() => _MenShoeState();
}

class _MenShoeState extends State<MenShoe> {
  List<CargoJsonModel> shoes = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchMenShoe();
  }

  Future<void> fetchMenShoe() async {
    print("fetchShoes Called");
    shoes = await ApiService.fetchMenShoesData();
    setState(() {});
    print("fetchShoes Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      body: BackgroundContainerWidget(
          child: SafeArea(
              child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          CustomAppbarWidget(
            scaffoldKey: _scaffoldKey,
            coffee: false,
          ),
          Positioned(
            top: 90,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Shoe Emporium",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
              top: 125,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: MediaQuery.of(context).size.height - 185,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: shoes.length,
                  itemBuilder: (context, index) {
                    var shoe = shoes[index];
                    final name = shoe.name;
                    final image = shoe.image;
                    final description = shoe.description;
                    final offerPrice = shoe.offerPrice;
                    final rating = double.parse(shoe.rating);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 380,
                            height: 170,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: const [
                                      Colors.black,
                                      Color.fromARGB(255, 17, 17, 19),
                                      Color.fromARGB(255, 62, 64, 66),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: containerShadowColor,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 5),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, '/menDetails',
                                  arguments: shoe),
                              child: Row(
                                children: [
                                  Container(
                                    height: 170,
                                    width: 170,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Hero(
                                        tag: shoe,
                                        child: Image.asset(
                                          "assets/images/MenShoes/$image.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    width: 175,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          description,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 221, 221, 221),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children:
                                                  List.generate(5, (index) {
                                                return Icon(
                                                  index < rating
                                                      ? Icons.star
                                                      : Icons.star_border,
                                                  color: iconColor,
                                                  size: 18,
                                                );
                                              }),
                                            ),
                                            Text(
                                              "  ($rating)",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 221, 221, 221),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$ ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.orange.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "$offerPrice",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: cookieratingtextcolor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ))
        ]),
      ))),
    );
  }
}
