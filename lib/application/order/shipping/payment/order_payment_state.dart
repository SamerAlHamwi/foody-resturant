import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/models/models.dart';

part 'order_payment_state.freezed.dart';

@freezed
class OrderPaymentState with _$OrderPaymentState {
  const factory OrderPaymentState({
    @Default(false) bool isLoading,
    @Default(false) bool isCalculateLoading,
    @Default([]) List<Payment> payments,
    @Default(0) int selectedIndex,
    OrderCalculateDetail? orderCalculate,
  }) = _OrderPaymentState;

  const OrderPaymentState._();
}
