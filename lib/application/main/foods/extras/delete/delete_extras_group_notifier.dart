import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../infrastructure/services/services.dart';
import 'delete_extras_group_state.dart';
import '../../../../../../domain/interface/interfaces.dart';

class DeleteExtrasGroupNotifier extends StateNotifier<DeleteExtrasGroupState> {
  final ProductsRepository _productsRepository;

  DeleteExtrasGroupNotifier(this._productsRepository)
      : super(const DeleteExtrasGroupState());

  Future<void> deleteExtrasGroup(BuildContext context,{VoidCallback? success, int? groupId}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _productsRepository.deleteExtrasGroup(groupId: groupId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (fail,status) {
        debugPrint('===> delete extras group fail $fail');
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
            context,
            text: fail,
            type: SnackBarType.error
        );
      },
    );
  }
}
