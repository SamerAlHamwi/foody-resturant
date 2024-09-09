import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/models/models.dart';

part 'order_products_state.freezed.dart';

@freezed
class OrderProductsState with _$OrderProductsState {
  const factory OrderProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _OrderProductsState;

  const OrderProductsState._();
}
