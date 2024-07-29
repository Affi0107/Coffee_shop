import 'package:flutter_riverpod/flutter_riverpod.dart';

class CargoState extends StateNotifier<List> {
  CargoState() : super([]);

  void empty() {
    state = [];
  }

  void update(Map data) {
    print(data);
    state = state.map((e) {
      if (e["name"] == data["name"]) {
        return {
          "category": e["category"],
          "name": e["name"],
          "price": data["price"],
          "cost": data["cost"],
          "icon": e["icon"],
          "quantity": data["quantity"],
          "size": data["size"],
        };
      }
      return e;
    }).toList();
    print("here   $state");
  }

  void additem(data) {
    print("add item $data");
    var present;
    for (int i = 0; i < state.length; i++) {
      if (state[i]["name"] == data["name"]) {
        present = state[i];
      }
    }
    if (present != null) {
      increase_quantity(present["name"], data["quantity"]);
    } else {
      state = [
        ...state,
        {
          "name": data["name"],
          "icon": data["image"],
          "price": double.parse(data["price"].toStringAsFixed(2)),
          "cost": double.parse(data["cost"].toStringAsFixed(2)),
          "quantity": data["quantity"],
          "category": data["category"],
          "size": data["size"]
        }
      ];
    }
  }

  void increase_quantity(name, qty) {
    final nl = state.map((e) {
      if (e["name"] == name) {
        return {
          ...e,
          "cost": e["price"] * (e["quantity"] + qty),
          "quantity": e["quantity"] + qty
        };
      }
      return e;
    });

    state = nl.toList();
  }

  void remove_item(String name) {
    var count = 1;
    final nl = state.map((e) {
      if (e["name"] != name) {
        return e;
      }
    }).toList();
    nl.removeWhere((element) => element == null);
    state = nl;
  }

  void decrease_quantity(String name) {
    final nl = state.map((e) {
      if (e["name"] == name) {
        return {
          ...e,
          "cost": e["price"] * (e["quantity"] - 1 < 0 ? 0 : e["quantity"] - 1),
          "quantity": e["quantity"] - 1 < 0 ? 0 : e["quantity"] - 1
        };
      }
      return e;
    });

    state = nl.toList();
    print(state);
  }
}

final CargoProvider =
    StateNotifierProvider<CargoState, List>((ref) => CargoState());
