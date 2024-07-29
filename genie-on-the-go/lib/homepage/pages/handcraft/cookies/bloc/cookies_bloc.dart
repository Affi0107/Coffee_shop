import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_2/homepage/model/json_model.dart';

part 'cookies_event.dart';
part 'cookies_state.dart';

class CookiesBloc extends Bloc<CookiesEvent, CookiesState> {
  CookiesBloc() : super(CookiesInitial()) {
    on<CookiesContainerClickedEvent>(cookiesContainerClickedEvent);
  }

  FutureOr<void> cookiesContainerClickedEvent(
      CookiesContainerClickedEvent event, Emitter<CookiesState> emit) {
    emit(CookiesToDetailPageActionState(cookie: event.cookie));
  }
}
