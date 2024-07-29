import 'package:flutter_riverpod/flutter_riverpod.dart';

class Switch extends StateNotifier<bool> {
  Switch() : super(true);
  void toggle(val) {
    state = val;
  }
}

final SwitchProvider = StateNotifierProvider<Switch, bool>((ref) => Switch());
