part of 'drinks_bloc.dart';

@immutable
sealed class DrinksState {}

abstract class DrinksActionState extends DrinksState {}

final class DrinksInitial extends DrinksState {}

class DrinksToDetailPageActionState extends DrinksActionState {
  JsonModel drink;
  DrinksToDetailPageActionState({required this.drink});
}
