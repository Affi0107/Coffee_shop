import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_2/homepage/model/json_model.dart';

part 'drinks_event.dart';
part 'drinks_state.dart';

class DrinksBloc extends Bloc<DrinksEvent, DrinksState> {
  DrinksBloc() : super(DrinksInitial()) {
    on<DrinksContainerClickedEvent>(drinksContainerClickedEvent);
  }

  FutureOr<void> drinksContainerClickedEvent(
      DrinksContainerClickedEvent event, Emitter<DrinksState> emit) {
    emit(DrinksToDetailPageActionState(drink: event.drink));
  }
}
