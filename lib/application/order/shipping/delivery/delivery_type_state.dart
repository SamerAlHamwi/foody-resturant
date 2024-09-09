import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/services/services.dart';

part 'delivery_type_state.freezed.dart';

@freezed
class DeliveryTypeState with _$DeliveryTypeState {
  const factory DeliveryTypeState({
    @Default(DeliveryType.delivery) DeliveryType type,
  }) = _DeliveryTypeState;

  const DeliveryTypeState._();
}
