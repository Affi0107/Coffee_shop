part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class FeedbackYesButtonClickedEvent extends FeedbackEvent {}

class FeedbackNoButtonClickedEvent extends FeedbackEvent {}

class FeedbackSubmitButtonClickedEvent extends FeedbackEvent {}
