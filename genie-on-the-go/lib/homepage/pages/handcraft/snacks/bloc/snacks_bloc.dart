import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_2/homepage/model/json_model.dart';

part 'snacks_event.dart';
part 'snacks_state.dart';

class SnacksBloc extends Bloc<SnacksEvent, SnacksState> {
  SnacksBloc() : super(SnacksInitial()) {
    on<SnacksContainerClickedEvent>(snacksContainerClickedEvent);
  }

  FutureOr<void> snacksContainerClickedEvent(
      SnacksContainerClickedEvent event, Emitter<SnacksState> emit) {
    emit(SnacksToDetailPageActionState(snack: event.snack));
  }
}
