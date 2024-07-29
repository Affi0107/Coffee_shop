// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/customdrawer/drawer_copyright_widget.dart';

class DrawerScreen extends ConsumerStatefulWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  ConsumerState<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends ConsumerState<DrawerScreen> {
  var colorr = LinearGradient(colors: [
    drawerscreenlineargradientcolor,
    drawerscreenlineargradientcolor1,
  ]);
  @override
  Widget build(BuildContext context) {
    const double fontsize = 22;
    const double fontsize2 = 20;
    const double fontsize3 = 17.5;

    return SafeArea(
      child: Drawer(
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey.shade400),
                padding: EdgeInsets.zero,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo1.png"))),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                home,
                style: TextStyle(
                  fontSize: fontsize,
                ),
              ),
              textColor: drawerscreentextcolor,
              iconColor: drawerscreeniconcolor,
              trailing: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              },
            ),
            ListTile(
              title: const Text(
                profileHeadingText,
                style: TextStyle(fontSize: fontsize),
              ),
              textColor: drawerscreentextcolor,
              iconColor: drawerscreeniconcolor,
              trailing: const Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/profile");
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: drawerscreendividercolor,
              ),
              child: ExpansionTile(
                title: const Text(
                  categories,
                  style: TextStyle(fontSize: fontsize),
                ),
                textColor: drawerscreentextcolor,
                collapsedTextColor: drawerscreentextcolor,
                iconColor: drawerscreeniconcolor,
                collapsedIconColor: drawerscreeniconcolor,
                children: [
                  ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: const Text(
                        food,
                        style: TextStyle(fontSize: fontsize2),
                      ),
                    ),
                    iconColor: drawerscreeniconcolor,
                    collapsedIconColor: drawerscreeniconcolor,
                    textColor: drawerscreenexpansiontilecolor,
                    collapsedTextColor: drawerscreenexpansiontilecolor,
                    children: [
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              snacks,
                              style: TextStyle(fontSize: fontsize3),
                            ),
                          ),
                          textColor: drawerscreentextcolor,
                          iconColor: drawerscreeniconcolor,
                          trailing: const Icon(Icons.breakfast_dining),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/snacks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              drinks,
                              style: TextStyle(fontSize: fontsize3),
                            ),
                          ),
                          textColor: drawerscreentextcolor,
                          iconColor: drawerscreeniconcolor,
                          trailing: const Icon(Icons.local_drink),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/drinks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          // tileColor: color,
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              cookies,
                              style: TextStyle(fontSize: fontsize3),
                            ),
                          ),
                          textColor: drawerscreentextcolor,
                          iconColor: drawerscreeniconcolor,
                          trailing: const Icon(Icons.cookie),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/cookies");
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: const Text(
                        apparels,
                        style: TextStyle(fontSize: fontsize2),
                      ),
                    ),
                    iconColor: drawerscreeniconcolor,
                    collapsedIconColor: drawerscreeniconcolor,
                    textColor: drawerscreenexpansiontilecolor,
                    collapsedTextColor: drawerscreenexpansiontilecolor,
                    children: [
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              apparelsmen,
                              style: TextStyle(fontSize: fontsize3),
                            ),
                          ),
                          textColor: drawerscreentextcolor,
                          iconColor: drawerscreeniconcolor,
                          trailing: const FaIcon(
                            FontAwesomeIcons.shoePrints,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/shoepage");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              apparelswomen,
                              style: TextStyle(fontSize: fontsize3),
                            ),
                          ),
                          textColor: drawerscreentextcolor,
                          iconColor: drawerscreeniconcolor,
                          trailing: FaIcon(
                            FontAwesomeIcons.shirt,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/bagpage");
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DrawerCopyrightWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
