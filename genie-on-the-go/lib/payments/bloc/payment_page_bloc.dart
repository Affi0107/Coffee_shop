import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_page_event.dart';
part 'payment_page_state.dart';

class PaymentPageBloc extends Bloc<PaymentPageEvent, PaymentPageState> {
  PaymentPageBloc() : super(PaymentpageInitial()) {
    on<PaymentPageSwapConfirmEvent>(paymentPageSwapConfirmEvent);
    
  }

  FutureOr<void> paymentPageSwapConfirmEvent(
      PaymentPageSwapConfirmEvent event, Emitter<PaymentPageState> emit) {
    emit(PaymentPageSwapConfirmState());
  }

  
}
