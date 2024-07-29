part of 'appbar_bloc.dart';

@immutable
sealed class AppbarEvent {}

class AppbarDrawerClickedEvent extends AppbarEvent {}

class AppbarLogoClickedEvent extends AppbarEvent {}

class AppbarNFCButtonClickedEvent extends AppbarEvent {}

class AppbarCartButtonNavigateEvent extends AppbarEvent {}
