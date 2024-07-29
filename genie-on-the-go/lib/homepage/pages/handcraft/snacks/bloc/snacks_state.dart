part of 'snacks_bloc.dart';

@immutable
sealed class SnacksState {}

abstract class SnacksActionState extends SnacksState {}

final class SnacksInitial extends SnacksState {}

class SnacksToDetailPageActionState extends SnacksActionState {
  JsonModel snack;
  SnacksToDetailPageActionState({required this.snack});
}
