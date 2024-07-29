part of 'payment_page_bloc.dart';

@immutable
sealed class PaymentPageEvent {}

class PaymentPageSwapConfirmEvent extends PaymentPageEvent {}

class PaymentPageGpayClickedEvent extends PaymentPageEvent {}
