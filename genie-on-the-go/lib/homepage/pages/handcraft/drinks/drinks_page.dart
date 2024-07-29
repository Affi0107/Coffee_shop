// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/pages/handcraft/drinks/bloc/drinks_bloc.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import '../../../../appbar/custom_appbar_widget.dart';
import '../../../data_fetching/api_service.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  List<JsonModel> drinks = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    fetchDrinks();
  }

  Future<void> fetchDrinks() async {
    print("fetchDrinks Called");
    drinks = await ApiService.fetchCoffeeData();
    setState(() {});
    print("fetchDrinks Completed");
  }

  @override
  Widget build(BuildContext context) {
    final DrinksBloc drinksBloc = DrinksBloc();
    return BlocConsumer<DrinksBloc, DrinksState>(
      bloc: drinksBloc,
      listenWhen: (previous, current) => current is DrinksActionState,
      buildWhen: (previous, current) => current is! DrinksActionState,
      listener: (context, state) {
        if (state is DrinksToDetailPageActionState) {
          Navigator.pushNamed(context, '/drinksdetails',
              arguments: state.drink);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          // appBar: AppbarWidget(),
          drawer: DrawerScreen(),
          body: BackgroundContainerWidget(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    CustomAppbarWidget(
                      scaffoldKey: _scaffoldKey,
                    ),
                    Positioned(
                      top: 90,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Caffeine Concoction",
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
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: drinks.length,
                          itemBuilder: (context, index) {
                            var drink = drinks[index];
                            final name = drink.name;
                            final image = drink.image;
                            final offerPrice = drink.offerPrice;
                            final rating = double.parse(drink.rating);
                            // final price = cookie.price;
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: 380,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      // color: cookieboxdeccolor,
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Color.fromARGB(255, 17, 17, 19),
                                            Color.fromARGB(255, 62, 64, 66),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: cookieboxshadowcolor,
                                          blurRadius: 2,
                                          spreadRadius: 1,
                                          offset: Offset(0, 5),
                                        )
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () => {
                                        drinksBloc.add(
                                            DrinksContainerClickedEvent(
                                                drink: drink))
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 170,
                                            width: 170,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Hero(
                                                tag: drink,
                                                child: Image.asset(
                                                  "assets/images/$image.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
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
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  productdescription,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 221, 221, 221),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: List.generate(5,
                                                          (index) {
                                                        return Icon(
                                                          index < rating
                                                              ? Icons.star
                                                              : Icons
                                                                  .star_border,
                                                          color:
                                                              cookieiconstarcolor,
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        color: Colors
                                                            .orange.shade700,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$offerPrice",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            cookieratingtextcolor,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
