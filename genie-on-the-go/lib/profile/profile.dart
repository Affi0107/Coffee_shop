// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/profile/profile_menu_item.dart';
import '../appbar/custom_appbar_widget.dart';
import '../constants/color_constants.dart';
import '../constants/text_constants.dart';
import 'edit_dialog_box.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _customIcon = false;
  var name = "Shyam Mishra";
  var email = "shyam45@gmail.com";
  @override
  Widget build(BuildContext context) {
    // var namecontroller = TextEditingController(text: name);
    // var emailcontroller = TextEditingController(text: email);
    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
                  top: 50,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            height: 330,
                            decoration: BoxDecoration(
                                color: firstContainerColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      // alignment: AlignmentDirectional(0, -0.8),
                                      height: 330 / 2,
                                      // child: Text(
                                      //   profileHeadingText,
                                      //   style: TextStyle(
                                      //     fontSize: 21,
                                      //     fontWeight: FontWeight.w600,
                                      //     color: profileHeadingTextColor,
                                      //   ),
                                      // ),
                                    ),
                                    Container(
                                      height: 330 / 2,
                                      decoration: BoxDecoration(
                                          color: secondContainerColor,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 55),
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          border: Border.all(
                                              color: circularImageBorderColor,
                                              width: 3),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        name,
                                        style: TextStyle(
                                            fontSize: 22, color: userNameColor),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        email,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: userEmailColor,
                                        ),
                                      ),
                                      TextButton.icon(
                                          onPressed: () {
                                            showDialog(
                                              barrierColor:
                                                  editDialogBoxBarrierColor,
                                              context: context,
                                              builder: (context) =>
                                                  EditDialogBox(
                                                      currentName: name,
                                                      currentEmail: email,
                                                      onSave:
                                                          (newName, newEmail) {
                                                        setState(() {
                                                          name = newName;
                                                          email = newEmail;
                                                        });
                                                      }),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: editButtonIconColor,
                                          ),
                                          label: Text(
                                            editButtonName,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: editButtonColor,
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 370,
                            decoration: BoxDecoration(
                                color: bigContainerColor,
                                border: Border.all(
                                  color: bigContainerBorderColor,
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20))),
                            child: Column(
                              children: [
                                ProfileMenuItem(
                                  title: myorderText,
                                  iconName: Icons.shopping_bag,
                                  pressed: () {
                                    Navigator.pushNamed(context, "/myOrders");
                                  },
                                ),
                                ProfileMenuItem(
                                  title: wishlistText,
                                  iconName: Icons.bookmark,
                                  pressed: () {
                                    Navigator.pushNamed(context, "/wishlist");
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 7),
                                  child: ExpansionTile(
                                    leading: Icon(
                                      Icons.settings,
                                      size: 26,
                                      color: settingsIconColor,
                                    ),
                                    title: Text(
                                      settingsText,
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: settingsTextColor,
                                      ),
                                    ),
                                    trailing: Icon(
                                      _customIcon
                                          ? FontAwesomeIcons.angleUp
                                          : FontAwesomeIcons.angleDown,
                                      size: 18,
                                      color: _customIcon
                                          ? angleUpIconColor
                                          : angleDownIconColor,
                                    ),
                                    onExpansionChanged: (bool expanded) {
                                      setState(() => _customIcon = expanded);
                                    },
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, "/address"),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: ListTile(
                                              leading: Icon(
                                                FontAwesomeIcons.mapLocationDot,
                                                size: 21,
                                                color: addressTextIconColor,
                                              ),
                                              title: Text(
                                                addressText,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: addressTextColor,
                                                ),
                                              ),
                                              trailing: Icon(
                                                FontAwesomeIcons.angleRight,
                                                size: 17,
                                                color:
                                                    SettingsangleRightIconColor,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ProfileMenuItem(
                                  title: helpText,
                                  iconName: Icons.info,
                                  pressed: () {
                                    Navigator.pushNamed(context, "/help");
                                  },
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
