import 'package:flutter_riverpod/flutter_riverpod.dart';

class Order extends StateNotifier<List> {
  Order() : super([]);
  void add(data) {
    state = [...state, data];
  }
}

final OrderProvider = StateNotifierProvider<Order, List>((ref) => Order());
