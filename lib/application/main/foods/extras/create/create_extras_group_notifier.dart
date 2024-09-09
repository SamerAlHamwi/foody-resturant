import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../infrastructure/services/services.dart';
import 'create_extras_group_state.dart';
import '../../../../../../domain/interface/interfaces.dart';

class CreateExtrasGroupNotifier extends StateNotifier<CreateExtrasGroupState> {
  final ProductsRepository _productsRepository;
  String _title = '';

  CreateExtrasGroupNotifier(this._productsRepository)
      : super(const CreateExtrasGroupState());

  Future<void> createExtrasGroup(BuildContext context,{VoidCallback? success}) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.createExtrasGroup(title: _title);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (fail,status) {
        debugPrint('===> create extras group fail $fail');
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
            context,
            text: fail,
            type: SnackBarType.error
        );
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
