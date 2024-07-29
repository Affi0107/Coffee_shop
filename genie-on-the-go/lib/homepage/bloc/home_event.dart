part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeOffersClickedNavigateEvent extends HomeEvent {
  JsonModel offer;
  HomeOffersClickedNavigateEvent(this.offer);
}

class HomeCurationsSnackNavigateEvent extends HomeEvent {}

class HomeCurationsDrinkNavigateEvent extends HomeEvent {}

class HomeCurationsCokkiesNavigateEvent extends HomeEvent {}

class HomePopularsNavigateEvent extends HomeEvent {
  JsonModel popular;
  HomePopularsNavigateEvent(this.popular);
}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeDrawerClickedEvent extends HomeEvent {}

class HomeLogoClickedEvent extends HomeEvent {}
