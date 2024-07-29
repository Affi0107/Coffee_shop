import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc() : super(AppbarInitial()) {
    on<AppbarDrawerClickedEvent>(appbarDrawerClickedEvent);
    on<AppbarLogoClickedEvent>(appbarLogoClickedEvent);
    on<AppbarCartButtonNavigateEvent>(appbarCartButtonNavigateEvent);
  }

  FutureOr<void> appbarDrawerClickedEvent(
      AppbarDrawerClickedEvent event, Emitter<AppbarState> emit) {
    emit(AppbarDrawerClickedActionState());
  }

  FutureOr<void> appbarLogoClickedEvent(
      AppbarLogoClickedEvent event, Emitter<AppbarState> emit) {
    emit(AppbarLogoClickedActionState());
  }

  FutureOr<void> appbarCartButtonNavigateEvent(
      AppbarCartButtonNavigateEvent event, Emitter<AppbarState> emit) {
    emit(AppbarCartClickedActionState());
  }
}
