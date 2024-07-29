// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/homepage/bloc/home_bloc.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/homepage/constant_homepage/constant_offers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data_fetching/api_service.dart';

class OfferingsWidget extends StatefulWidget {
  const OfferingsWidget({super.key});

  @override
  State<OfferingsWidget> createState() => _OfferingsState();
}

class _OfferingsState extends State<OfferingsWidget> {
  List<JsonModel> offers = [];

  @override
  void initState() {
    super.initState();

    fetchOffers();
  }

  Future<void> fetchOffers() async {
    print("fetchOffers Called");
    offers = await ApiService.fetchOffersData();
    setState(() {});
    print("fetchOffers Completed");
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToOfferPageActionState) {
          Navigator.pushNamed(context, '/offerspage', arguments: state.offer);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: containerheight,
          child: PageView.builder(
            itemCount: offers.length,
            // padEnds: false,
            // pageSnapping: false,
            physics: BouncingScrollPhysics(),
            controller: PageController(
              viewportFraction: pageController_viewportFraction,
            ),
            itemBuilder: (context, index) {
              var offer = offers[index];
              final name = offer.name;
              final image = offer.image;
              final offerPrice = offer.offerPrice;
              final rating = double.parse(offer.rating);

              return InkWell(
                onTap: () =>
                    // Navigator.pushNamed(context, '/offerspage', arguments: offer),
                    homeBloc.add(HomeOffersClickedNavigateEvent(offer)),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(margin_edge),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(margin_borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: margin_boxShadow_color,
                            offset: Offset(margin_boxShadow_offSet_startPoint,
                                margin_boxShadow_offSet_endPoint),
                            blurRadius: margin_boxShadow_blurRadius,
                            spreadRadius: margin_boxShadow_spreadRadius,
                          ),
                        ],
                      ),
                      child: Hero(
                        tag: offer,
                        child: Image.asset(
                          "assets/images/$image.jpg",
                          height: image_height,
                          width: image_width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 7.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.transparent.withOpacity(0.7),
                              const Color.fromARGB(255, 10, 10, 10)
                              // Colors.black
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  color: name_color,
                                  fontSize: name_fontSize,
                                  fontWeight: FontWeight.w700)),
                          Row(
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.orange.shade700,
                                    size: 16,
                                  );
                                }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: totalRating_padding_horizondal),
                                child: Text(
                                  "($rating)",
                                  style: TextStyle(
                                      fontSize: rating_fontSize,
                                      fontWeight: FontWeight.w700,
                                      color: rating_color),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\$ ",
                                style: TextStyle(
                                  fontSize: offerprice_fontSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange.shade700,
                                ),
                              ),
                              Text(
                                "$offerPrice",
                                style: TextStyle(
                                  fontSize: offerprice_fontSize,
                                  fontWeight: FontWeight.w600,
                                  color: offerprice_color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
