import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'delivery_type_state.dart';
import '../../../../infrastructure/services/services.dart';

class DeliveryTypeNotifier extends StateNotifier<DeliveryTypeState> {
  DeliveryTypeNotifier() : super(const DeliveryTypeState());

  void setType(DeliveryType type) {
    if (type == state.type) {
      return;
    }
    state = state.copyWith(type: type);
  }
}
