part of 'cookies_bloc.dart';

@immutable
sealed class CookiesState {}

abstract class CookiesActionState extends CookiesState {}

final class CookiesInitial extends CookiesState {}

final class CookiesToDetailPageActionState extends CookiesActionState {
   JsonModel cookie;
  CookiesToDetailPageActionState({required this.cookie});
}
