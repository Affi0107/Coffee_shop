import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_2/homepage/model/json_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeOffersClickedNavigateEvent>(homeOffersClickedNavigateEvent);
    on<HomeCurationsSnackNavigateEvent>(homeCurationsSnackNavigateEvent);
    on<HomeCurationsDrinkNavigateEvent>(homeCurationsDrinkNavigateEvent);
    on<HomeCurationsCokkiesNavigateEvent>(homeCurationsCokkiesNavigateEvent);
    on<HomePopularsNavigateEvent>(homePopularsNavigateEvent);
    on<HomeLogoClickedEvent>(homeLogoClickedEvent);
  }

  FutureOr<void> homeOffersClickedNavigateEvent(
      HomeOffersClickedNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToOfferPageActionState(offer: event.offer));
  }

  FutureOr<void> homeLogoClickedEvent(
      HomeLogoClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeCurationsSnackNavigateEvent(
      HomeCurationsSnackNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToSnackPageActionState());
  }

  FutureOr<void> homeCurationsDrinkNavigateEvent(
      HomeCurationsDrinkNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToDrinkPageActionState());
  }

  FutureOr<void> homeCurationsCokkiesNavigateEvent(
      HomeCurationsCokkiesNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCookiesPageActionState());
  }

  FutureOr<void> homePopularsNavigateEvent(
      HomePopularsNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToPopularPageActionState(popular: event.popular));
  }
}
