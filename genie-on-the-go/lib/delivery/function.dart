import 'package:flutter/services.dart';

class AadharInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);

      int index = i + 1;
      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  ");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(
          offset: buffer.toString().length,
        ));
  }
}


// class MaskTextInputFormatter extends TextInputFormatter {
//   final String mask;
//   final Map<String, RegExp> filter;

//   MaskTextInputFormatter({required this.mask, required this.filter});

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String maskedText = '';
//     int maskCharIndex = 0;

//     for (int i = 0; i < mask.length; i++) {
//       if (mask[i] == '#') {
//         if (maskCharIndex < newValue.text.length) {
//           String char = newValue.text[maskCharIndex];
//           if (filter.containsKey('#') && filter['#']!.hasMatch(char)) {
//             maskedText += char;
//             maskCharIndex++;
//           }
//         }
//       } else {
//         maskedText += mask[i];
//       }
//     }

//     return TextEditingValue(
//       text: maskedText,
//       selection: TextSelection.collapsed(offset: maskedText.length),
//     );
//   }
// }

