// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/bloc/home_bloc.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/homepage/constant_homepage/constant_populars.dart';
import '../../../data_fetching/api_service.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularState();
}

class _PopularState extends State<PopularWidget> {
  List<JsonModel> populars = [];

  @override
  void initState() {
    super.initState();

    fetchPopularData();
  }

  Future<void> fetchPopularData() async {
    print("fetchPopular Called");
    populars = await ApiService.fetchPopularData();
    setState(() {});
    print("fetchPopular Completed");
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToPopularPageActionState) {
          Navigator.pushNamed(context, '/popularspage',
              arguments: state.popular);
        }
      },
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: populars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridView_crossAxisCount,
            crossAxisSpacing: gridView_crossAxisSpacing,
            mainAxisSpacing: gridView_mainAxisSpacing,
            // childAspectRatio: 1.6 / 2,
            mainAxisExtent: gridView_mainAxisExtent,
          ),
          itemBuilder: (context, index) {
            var popular = populars[index];
            final image = popular.image;
            final name = popular.name;
            final rating = double.parse(popular.rating);
            final price = popular.price;

            return Card(
              elevation: 20,
              // shadowColor: Color.fromARGB(255, 6, 6, 39),
              shadowColor: Color.fromARGB(255, 4, 4, 71),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [BoxShadow()],
                  // gradient: LinearGradient(colors: [
                  //   Color.fromARGB(255, 0, 0, 0),
                  //   Color.fromARGB(255, 21, 21, 22),
                  //   Color(0xFF4D4F52)
                  // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  gradient: LinearGradient(colors: [
                    Colors.black,
                    Color.fromARGB(255, 17, 17, 19),
                    Color.fromARGB(255, 50, 51, 53)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: InkWell(
                  onTap: () => {
                    // Navigator.pushNamed(context, '/popularspage', arguments: popular)
                    homeBloc.add(HomePopularsNavigateEvent(popular))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Hero(
                            tag: popular,
                            child: Image.asset(
                              'assets/images/$image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: name_fontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        index < rating
                                            ? Icons.star
                                            : Icons.star_border_purple500,
                                        color: Colors.orange.shade700,
                                        size: 15,
                                      );
                                    }),
                                  ),
                                  Text(
                                    "  ($rating)",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 221, 221, 221),
                                      fontSize: rating_fontSize,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                              Row(
                                children: [
                                  Text(
                                    "\$ ",
                                    style: TextStyle(
                                      color: Colors.orange.shade700,
                                      fontSize: price_fontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "$price",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: price_fontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
            );
          },
        );
      },
    );
  }
}
