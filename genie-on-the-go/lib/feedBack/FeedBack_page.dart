// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/feedBack/bloc/feedback_bloc.dart';
import 'package:project_2/feedBack/orderrecieved.dart';
import 'package:project_2/feedBack/ratingStar.dart';
import 'package:project_2/feedBack/thankYou.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/feedBack/yesrecieved.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _MapScreenState();
}

class _MapScreenState extends State<FeedBackPage> {
  late GoogleMapController mapController;
  bool isButtonclicked5 = false;
  List<bool> _starStates = [false, false, false, false, false];
  List<String> _emojis = ['😡', '🙁', '😐', '🙂', '😀'];
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 12,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<bool> starRatings = [false, false, false, false, false];

  void updateStarRating(int index) {
    setState(() {
      for (int i = 0; i < starRatings.length; i++) {
        starRatings[i] = i <= index;
      }
    });
  }

  _onStarPressed(int index) {
    setState(() {
      for (int i = 0; i < _starStates.length; i++) {
        _starStates[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      backgroundColor: feedbackbgcolor,
      body: Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 400, // Set a fixed height for the map container
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                markers: {
                  Marker(
                    markerId: MarkerId('Marker'),
                    position: LatLng(37.773972, -122.431297),
                    infoWindow: InfoWindow(title: 'google marker'),
                  ),
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  //color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        starquote,
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: submitcolor),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          5,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                updateStarRating(index);
                                _onStarPressed(index);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  starRatings[index]
                                      ? Icons.star
                                      : Icons.star_outline_sharp,
                                  size: 38,
                                  color: starcolor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _starStates.indexWhere((element) => element) != -1
                                ? _emojis[_starStates
                                    .indexWhere((element) => element)]
                                : '',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        commentquote,
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: commentbox),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1),
                          color: commentboxcolor,
                        ),
                        height: 150,
                        child: TextFormField(
                          cursorColor: textcursorcolor,
                          style: TextStyle(
                            color: navTextColor,
                            fontSize: 20,
                          ),
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: hinttext,
                            hintStyle: GoogleFonts.roboto(),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isButtonclicked5 = !isButtonclicked5;
                            });
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButtonclicked5
                                ? isclickedcolor
                                : notclickedcolor,
                            minimumSize: Size(200, 50),
                          ),
                          child: Text(
                            submit,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: submitcolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
