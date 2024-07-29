import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/payments/payment_app.dart';

// ignore: camel_case_types
class Address extends StatefulWidget {
  Address({super.key, required this.data, required this.coffee});
  final coffee;

  final Map<String, dynamic> data;

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool isEditable = false;
  bool isEditableEmail = false;
  bool isEditableMobile = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: widget.data["name"].toString());
    final TextEditingController emailController =
        TextEditingController(text: widget.data["email_id"].toString());
    final TextEditingController MobileController =
        TextEditingController(text: widget.data["mobile_number"].toString());
    final TextEditingController add1Controller =
        TextEditingController(text: widget.data["address1"].toString());
    final TextEditingController add2Controller =
        TextEditingController(text: widget.data["address2"].toString());
    final TextEditingController cityController =
        TextEditingController(text: widget.data["city"].toString());
    final TextEditingController pinController =
        TextEditingController(text: widget.data["pin_code"].toString());
    final TextEditingController stateController =
        TextEditingController(text: widget.data["state"].toString());
    final TextEditingController countryController =
        TextEditingController(text: widget.data["country"].toString());
    final TextEditingController controller = TextEditingController();

    @override
    void dispose() {
      add1Controller.dispose();
      add2Controller.dispose();
      cityController.dispose();
      pinController.dispose();
      stateController.dispose();
      countryController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppbarWidget(),
      body: BackgroundContainerWidget(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  adrname,
                  // "$data",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  enabled: false,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      hintText: adrename,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      emailText,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isEditableEmail = !isEditableEmail;
                          });
                        },
                        // ignore: prefer_const_constructors
                        child: Text(
                          editableText,
                          style: TextStyle(color: editBttnColor, fontSize: 18),
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      hintText: adreemail,
                      enabled: isEditableEmail,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      adrmobile,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isEditableMobile = !isEditableMobile;
                          });
                        },
                        // ignore: prefer_const_constructors
                        child: Text(
                          editableText,
                          style: TextStyle(color: editBttnColor, fontSize: 18),
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: MobileController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  enabled: isEditableMobile,
                  decoration: InputDecoration(
                      hintText: mobileHintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          deliveryAddressText,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isEditable = !isEditable;
                              });
                            },
                            // ignore: prefer_const_constructors
                            child: Text(
                              editableText,
                              style:
                                  TextStyle(color: editBttnColor, fontSize: 18),
                            )),
                      ],
                    ),
                    TextFormField(
                      controller: add1Controller,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          hintText: addressoneText,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      enabled: isEditable,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        TextFormField(
                          controller: add2Controller,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          enabled: isEditable,
                          decoration: InputDecoration(
                              hintText: addresstwoText,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              cityName,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 160,
                            ),
                            Text(
                              pinNum,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: cityController,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  enabled: isEditable,
                                  decoration: InputDecoration(
                                      hintText: cityName1,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: pinController,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                      hintText: pinNum1,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  enabled: isEditable,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              state,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 160,
                            ),
                            Text(
                              country,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: stateController,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  enabled: isEditable,
                                  decoration: InputDecoration(
                                      hintText: state1,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: countryController,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  enabled: isEditable,
                                  decoration: InputDecoration(
                                      hintText: adrepin,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              (feedbackcollapsebgcolor))),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentApp(
                                    coffee: widget.coffee, checkout: false)));
                      },
                      child: const Text(
                        saveAddressBttn,
                        style: TextStyle(fontSize: 20, color: saveBttnColor),
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
