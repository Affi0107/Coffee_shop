// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import '../appbar/custom_appbar_widget.dart';
import '../customdrawer/drawerScreen.dart';

class DeveloperTeam extends StatelessWidget {
  DeveloperTeam({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      extendBodyBehindAppBar: true,
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
                  top: 85,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height - 132,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Text(
                          "Leadership",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardWidget(
                                image: "assets/images/profile.png",
                                name: "Somnath Chatterjee",
                                designation: "Senior Director",
                                email: "somnath.chatterjee@ltimindtree.com"),
                            SizedBox(width: 10),
                            CardWidget(
                                image: "assets/images/dev_team/img.jpg",
                                name: "Santanu Mukherjee",
                                designation: "Managing Principal",
                                email: "Santanu.Mukherjee@ltimindtree.com"),
                          ],
                        ),
                        Text(
                          "Lead",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            CardWidget(
                                image: "assets/images/dev_team/img 3.jpg",
                                name: "Shashi Kant",
                                designation: "Senior Specialist",
                                email: "shashi.kant@ltimindtree.com"),
                          ],
                        ),
                        Text(
                          "Developers",
                          style: TextStyle(
                              fontSize: 18.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 3),
                        GridView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 227),
                          children: [
                            CardWidget(
                                image: "assets/images/dev_team/img 4.jpg",
                                name: "Kunal Chandra",
                                designation: "Software Engineer",
                                email: "kunal.chandra@ltimindtree.com"),
                            CardWidget(
                                image: "assets/images/dev_team/img 5.png",
                                name: "Afiya Ansari",
                                designation: "Software Engineer",
                                email: "afiya.ansari@ltimindtree.com"),
                            CardWidget(
                                image: "assets/images/dev_team/img 6.jpg",
                                name: "Deep Behera",
                                designation: "Software Engineer",
                                email: "deep.behera@ltimindtree.com"),
                            CardWidget(
                                image: "assets/images/dev_team/img 7.png",
                                name: "Sarankumar Sivakumar",
                                designation: "Software Engineer",
                                email: "sarankumar.sivakumar@ltimindtree.com"),
                            CardWidget(
                                image: "assets/images/dev_team/img 8.png",
                                name: "Gaurang Choudhary",
                                designation: "Software Engineer",
                                email: "gaurang.choudhary@ltimindtree.com"),
                            CardWidget(
                                image: "assets/images/dev_team/img 9.png",
                                name: "Ajay P",
                                designation: "Software Engineer",
                                email: "ajay.p@ltimindtree.com"),
                            CardWidget(
                                image: "assets/images/dev_team/img 10.png",
                                name: "A Prathaban",
                                designation: "Software Engineer",
                                email: "a.prathaban@ltimindtree.com"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
    required this.email,
  });

  final String image;
  final String name;
  final String designation;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shadowColor: Colors.grey.shade900,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          gradient: LinearGradient(colors: [
            Colors.black,
            Color.fromARGB(255, 17, 17, 19),
            Color.fromARGB(255, 50, 51, 53)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        height: 222,
        width: 180,
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(height: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  designation,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
