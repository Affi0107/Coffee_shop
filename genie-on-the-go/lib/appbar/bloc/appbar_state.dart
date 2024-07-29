part of 'appbar_bloc.dart';

@immutable
sealed class AppbarState {}

abstract class AppbarActionState extends AppbarState {}

final class AppbarInitial extends AppbarState {}

class AppbarDrawerClickedActionState extends AppbarActionState {}

class AppbarLogoClickedActionState extends AppbarActionState {}

class AppbarCartClickedActionState extends AppbarActionState {}
