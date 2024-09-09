import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_addon_state.freezed.dart';

@freezed
class EditAddonState with _$EditAddonState {
  const factory EditAddonState({@Default(false) bool isLoading}) =
      _EditAddonState;

  const EditAddonState._();
}
