// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/color_constants.dart';
import '../constants/text_constants.dart';

class EditDialogBox extends StatefulWidget {
  const EditDialogBox(
      {super.key,
      required this.currentName,
      required this.currentEmail,
      required this.onSave});
  final String currentName;
  final String currentEmail;
  final Function(String, String) onSave;

  @override
  State<EditDialogBox> createState() => _EditDialogBoxState();
}

class _EditDialogBoxState extends State<EditDialogBox> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userNameController.text = widget.currentName;
    userEmailController.text = widget.currentEmail;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: alertDialogBackgroundColor,
      insetPadding: EdgeInsets.only(bottom: 100),
      content: StatefulBuilder(builder: (context, setState) {
        return Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).animate().scale(),
                    SizedBox(width: 18),
                    Container(
                      width: 290,
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: thirdContainerColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            editDialogHeadingText,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.1,
                                color: profileTextColor),
                          ),
                          SizedBox(height: 10),
                          Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nameText,
                                    style: TextStyle(
                                        color: nameTextColor,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.1,
                                        fontSize: 16.5),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: userNameController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: inputFillColor,
                                      hintText: nameInputHintText,
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                              color:
                                                  inputEnabledBordersideColor)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                            color: inputFocusedBordersideColor),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter User name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    emailText,
                                    style: TextStyle(
                                        color: emailTextColor,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.1,
                                        fontSize: 16.5),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: userEmailController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: inputFillColor,
                                      hintText: emailInputHintText,
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                              color:
                                                  inputEnabledBordersideColor)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: inputFocusedBordersideColor,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Email";
                                      } else if (!value.contains("@")) {
                                        return "Email format is incorrect";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 18),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            saveElevatedButtonBackgroundColor,
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width,
                                            45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7))),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        // formKey.currentState!.reset();
                                        widget.onSave(userNameController.text,
                                            userEmailController.text);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      saveElevatedButtonText,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.5,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                        .animate()
                        .slideX(delay: 100.ms, duration: 300.ms, begin: -0.1),
                  ].animate(interval: 80.ms).fade(duration: 300.ms)),
            ],
          ),
        );
      }),
    );
  }
}
