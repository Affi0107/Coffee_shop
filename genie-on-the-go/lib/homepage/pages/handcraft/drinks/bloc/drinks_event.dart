part of 'drinks_bloc.dart';

@immutable
sealed class DrinksEvent {}

class DrinksContainerClickedEvent extends DrinksEvent {
  JsonModel drink;
  DrinksContainerClickedEvent({required this.drink});
}
