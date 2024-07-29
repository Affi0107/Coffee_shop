import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<FeedbackYesButtonClickedEvent>(feedbackYesButtonClickedEvent);
    on<FeedbackNoButtonClickedEvent>(feedbackNoButtonClickedEvent);
    on<FeedbackSubmitButtonClickedEvent>(feedbackSubmitButtonClickedEvent);
  }

  FutureOr<void> feedbackYesButtonClickedEvent(
      FeedbackYesButtonClickedEvent event, Emitter<FeedbackState> emit) {
    emit(FeedbackYesButtonClickedState());
  }

  FutureOr<void> feedbackNoButtonClickedEvent(
      FeedbackNoButtonClickedEvent event, Emitter<FeedbackState> emit) {
    emit(FeedbackNoButtonClickedState());
  }

  FutureOr<void> feedbackSubmitButtonClickedEvent(
      FeedbackSubmitButtonClickedEvent event, Emitter<FeedbackState> emit) {
    emit(FeedbackSubmitButtonClickedState());
  }
}
