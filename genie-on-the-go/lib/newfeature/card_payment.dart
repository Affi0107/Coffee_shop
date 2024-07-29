import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:project_2/constants/text_constants.dart';

import '../constants/color_constants.dart';

class CardPayment extends StatelessWidget {
  CardPayment({super.key});
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            gradient: LinearGradient(
              colors: [
                cardpaymentlineargradient1,
                cardpaymentlineargradient2,
              ],
            ),
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Image.asset(
                "assets/images/card.png",
                height: 60,
              ),
              Text(
                cardpayment,
                style: TextStyle(
                  color: cardpaymentcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              )
            ],
          )),
      children: [
        CreditCardWidget(
          cardNumber: "9898989898989898",
          expiryDate: "77/88",
          cardHolderName: "cardHolderName",
          cvvCode: "XXX",
          showBackView: true,
          onCreditCardWidgetChange: (p0) {},
        ),
        CreditCardForm(
            cardNumber: "cardNumber",
            expiryDate: "expiryDate",
            cardHolderName: "cardHolderName",
            cvvCode: "cvvCode",
            onCreditCardModelChange: (I) {},
            formKey: formKey2),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              foregroundColor: cardpaymentforegroundcolor),
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              validate,
              style: TextStyle(
                color: paymenttextcolor,
                fontFamily: 'halter',
                fontSize: 14,
                package: 'flutter_credit-card',
              ),
            ),
          ),
          onPressed: () {
            if (formKey2.currentState!.validate()) {
              print('valid');
            } else {
              print('inValid');
            }
          },
        )
      ],
    );
  }
}
