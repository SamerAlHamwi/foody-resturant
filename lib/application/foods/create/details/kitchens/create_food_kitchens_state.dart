import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../infrastructure/models/models.dart';

part 'create_food_kitchens_state.freezed.dart';

@freezed
class CreateFoodKitchensState with _$CreateFoodKitchensState {
  const factory CreateFoodKitchensState({
    @Default(false) bool isLoading,
    @Default([]) List<KitchenModel> kitchens,
    @Default(0) int activeIndex,
    TextEditingController? kitchenController,
  }) = _CreateFoodKitchensState;

  const CreateFoodKitchensState._();
}
