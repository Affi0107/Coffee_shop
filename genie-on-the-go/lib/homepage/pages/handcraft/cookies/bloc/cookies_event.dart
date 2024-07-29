part of 'cookies_bloc.dart';

@immutable
sealed class CookiesEvent {}

class CookiesContainerClickedEvent extends CookiesEvent {
  JsonModel cookie;
  CookiesContainerClickedEvent({required this.cookie});
}
