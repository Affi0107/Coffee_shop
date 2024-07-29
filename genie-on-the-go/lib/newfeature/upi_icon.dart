import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/order_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';

import 'package:project_2/loading/loadingScreen.dart';

class UpiIcon extends ConsumerWidget {
  UpiIcon(
      {super.key,
      required this.coffee,
      required this.height,
      required this.width,
      required this.assets});
  final coffee;
  final double height;
  final double width;
  final String assets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (coffee) {
          ref.read(OrderProvider.notifier).add(ref.read(CartProvider));
          ref.read(CartProvider.notifier).empty();
        } else {
          ref.read(OrderProvider.notifier).add(ref.read(CargoProvider));
          ref.read(CargoProvider.notifier).empty();
        }

        showDialog(
          context: context,
          builder: (context) {
            return const LoadingScreen();
          },
        );

        // Navigator.pushReplacementNamed(context, "/loading");
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(assets),
      ),
    );
  }
}
