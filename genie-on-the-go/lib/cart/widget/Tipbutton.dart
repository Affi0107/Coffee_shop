import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
// import 'package:project_2/cart/cart/riverpod/tipstate_provider.dart';

class Tipbutton extends ConsumerStatefulWidget {
  const Tipbutton(
      {super.key,
      required this.selected,
      required this.amount,
      required addtip});

  final amount;
  final selected;
  @override
  ConsumerState<Tipbutton> createState() => _TipbuttonState();
}

class _TipbuttonState extends ConsumerState<Tipbutton> {
  @override
  Widget build(BuildContext context) {
    final func = ref.watch(TipProvider.notifier);
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: widget.selected == true
              ? Color.fromARGB(255, 110, 47, 24)
              : Color.fromARGB(255, 247, 238, 238),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: TextButton(
          style: ButtonStyle(mouseCursor: MaterialStateMouseCursor.clickable),
          onPressed: () {
            //     widget.addtip(widget.amount.toDouble());
            print(widget.amount);
            func.settip(widget.amount);
          },
          child: Text(
            widget.amount.toString(),
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: widget.selected == true
                    ? Colors.white
                    : Color.fromARGB(255, 67, 73, 72)),
          )),
    );
  }
}
