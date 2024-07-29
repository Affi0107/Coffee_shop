import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class CookingInstructions extends ConsumerStatefulWidget {
  const CookingInstructions({super.key});

  @override
  ConsumerState<CookingInstructions> createState() =>
      _CookingInstructionsState();
}

class _CookingInstructionsState extends ConsumerState<CookingInstructions> {
  final instruct_controller = TextEditingController(text: "");
  var text = "";
  @override
  Widget build(BuildContext context) {
    final instruction = ref.read(TipProvider)["instructions"];
    print(instruction);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        // gradient: LinearGradient(colors: [
        //   Color.fromARGB(255, 0, 0, 0),
        //   Color.fromARGB(255, 21, 21, 22),
        //   Color(0xFF4D4F52)
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        color: cookinginstructionboxdecorationcolor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: cookinginstructionboxshadowcolor,
            offset: const Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: ExpansionTile(
        onExpansionChanged: (value) {},
        textColor: cookinginstructiontextcolor,
        childrenPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        title: const Text(
          cookinginstruction,
          style: TextStyle(
              fontSize: 18,
              color: cartbuttoncolor,
              fontWeight: FontWeight.bold),
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
            child: TextFormField(
              initialValue: ref.watch(TipProvider)["instructions"],
              onChanged: (value) {
                ref.watch(TipProvider.notifier).addinstruction(value);
              },
              // controller: instruct_controller,

              //   cursorColor: Color.fromARGB(255, 105, 73, 14),
              cursorHeight: CircularProgressIndicator.strokeAlignCenter,
              cursorColor: cookinginstructioncursorcolor,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: cartbuttoncolor,
                  fontStyle: FontStyle.normal),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: cookinginstructionbordercolor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: cookinginstructionbordercolor))),
            ),
          ),
        ],
      ),
    );
  }
}
