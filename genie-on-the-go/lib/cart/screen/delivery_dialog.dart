// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

import '../../delivery/address_page/address.dart';
import '../../delivery/function.dart';
import '../../homepage/reusable_widgets/background_container_widget.dart';

class DeliveryDialog extends StatefulWidget {
  const DeliveryDialog({super.key, required this.coffee});
  final coffee;
  @override
  State<DeliveryDialog> createState() => _DeliveryDialogState();
}

class _DeliveryDialogState extends State<DeliveryDialog> {
  Future<Map<String, dynamic>> loadJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/aadhar.json');
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController aadharController = TextEditingController();

    return AlertDialog(
        insetPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: FutureBuilder(
            future: loadJson(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // 10-digit key (Aadhar number)
                var data = snapshot.data[akey];
                print(data);
                var name1 = '${data['name']}';
                // return address();
                return BackgroundContainerWidget(
                  child: Container(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: aadharController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            AadharInputFormatter()
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: aadharBackgroundColor,
                            labelText: aadharNum,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          maxLength: 16,
                          onChanged: (value) {},
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 11,
                            ),
                            backgroundColor: buttonBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: bordorColor,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Address(
                                          data: data,
                                          coffee: widget.coffee,
                                        )));
                          },
                          child: Text(
                            nextbttn,
                            style: TextStyle(
                                fontSize: 17, color: containerDecorationColor),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
