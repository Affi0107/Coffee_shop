import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2/delivery/address_page/address.dart';
import 'package:project_2/delivery/function.dart';
//import 'package:flutter_application_1/address_page/address.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.title, required this.coffee})
      : super(key: key);
  final coffee;
  final String title;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<Map<String, dynamic>> loadJson() async {
    final String jsonString = await rootBundle.loadString('assets/aadhar.json');
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }

  TextEditingController aadharController = TextEditingController();
  // final _aadharFormatter = MaskTextInputFormatter(
  //     mask: '#### #### ####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aadhar validator',
          selectionColor: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: loadJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            String key = '123456789012'; // 10-digit key (Aadhar number)
            var data = snapshot.data[key];
            print(data);
            var name1 = '${data['name']}';

            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: aadharController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(14),
                    AadharInputFormatter()
                    //_aadharFormatter
                  ],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: 'Enter Aadhar Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Address(
                                  data: data,
                                  coffee: widget.coffee,
                                )));
                  },
                  child: Text("next"),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
