import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndexProvider = StateNotifierProvider((ref) => PageIndexNotifier());

class PageIndexNotifier extends StateNotifier<int> {
  PageIndexNotifier() : super(0);

  void pageIndex(int newIndex) {
    print(newIndex);
    state = newIndex;
  }
}
