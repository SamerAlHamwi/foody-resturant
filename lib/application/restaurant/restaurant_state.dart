import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/models/models.dart';

part 'restaurant_state.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(false) bool isLoading,
    String? backgroundImageFile,
    String? logoImageFile,
    String? orderPayment,
    ShopData? shop,
  }) = _RestaurantState;

  const RestaurantState._();
}
