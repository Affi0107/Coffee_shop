part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  HomeLoadedSuccessState();
}

class HomeErrorState extends HomeState {}

class HomeNavigateToOfferPageActionState extends HomeActionState {
  JsonModel offer;

  HomeNavigateToOfferPageActionState({required this.offer});
}

class HomeNavigateToSnackPageActionState extends HomeActionState {}

class HomeNavigateToDrinkPageActionState extends HomeActionState {}

class HomeNavigateToCookiesPageActionState extends HomeActionState {}

class HomeNavigateToPopularPageActionState extends HomeActionState {
  JsonModel popular;

  HomeNavigateToPopularPageActionState({required this.popular});
}

class HomeNavigateToCartPageActionState extends HomeActionState {}
