import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/models/models.dart';

part 'edit_food_details_state.freezed.dart';

@freezed
class EditFoodDetailsState with _$EditFoodDetailsState {
  const factory EditFoodDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool active,
    @Default('') String title,
    @Default('') String interval,
    @Default('') String description,
    @Default('') String minQty,
    @Default('') String maxQty,
    @Default('') String tax,
    @Default('') String barcode,
    ProductData? product,
    @Default([]) List<String> images,
    @Default([]) List<Galleries> listOfUrls,
  }) = _EditFoodDetailsState;

  const EditFoodDetailsState._();
}
