part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

abstract class FeedbackActionState extends FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackYesButtonClickedState extends FeedbackActionState {}

final class FeedbackNoButtonClickedState extends FeedbackActionState {}

final class FeedbackSubmitButtonClickedState extends FeedbackActionState {}
