part of 'snacks_bloc.dart';

@immutable
sealed class SnacksEvent {}

class SnacksContainerClickedEvent extends SnacksEvent {
  JsonModel snack;
  SnacksContainerClickedEvent({required this.snack});
}
