import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../infrastructure/models/models.dart';

part 'edit_food_categories_state.freezed.dart';

@freezed
class EditFoodCategoriesState with _$EditFoodCategoriesState {
  const factory EditFoodCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
    @Default(0) int activeIndex,
    TextEditingController? categoriesController,
    CategoryData? foodCategory,
  }) = _EditFoodCategoriesState;

  const EditFoodCategoriesState._();
}
