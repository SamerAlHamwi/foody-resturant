import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../infrastructure/models/models.dart';

part 'create_food_addons_state.freezed.dart';

@freezed
class CreateFoodAddonsState with _$CreateFoodAddonsState {
  const factory CreateFoodAddonsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> addons,
  }) = _CreateFoodAddonsState;

  const CreateFoodAddonsState._();
}
