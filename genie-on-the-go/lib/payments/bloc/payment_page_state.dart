part of 'payment_page_bloc.dart';

@immutable
sealed class PaymentPageState {}

abstract class PaymentpageActionState extends PaymentPageState {}

final class PaymentpageInitial extends PaymentPageState {}

final class PaymentPageSwapConfirmState extends PaymentpageActionState {}


