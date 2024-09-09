import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_order_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class CreateOrderNotifier extends StateNotifier<CreateOrderState> {
  final OrdersRepository _ordersRepository;

  CreateOrderNotifier(this._ordersRepository,)
      : super(const CreateOrderState());

  Future<void> createOrder({
    required DeliveryType deliveryType,
    UserData? user,
    required List<Stock> stocks,
    required String deliveryDate,
    required String address,
    LocationData? location,
    required String entrance,
    required String floor,
    required String house,
    ValueChanged<int>? orderSuccess,
    Function(String)? failed,
  }) async {

    state = state.copyWith(isCreating: true);
    final response = await _ordersRepository.createOrder(
      deliveryType: deliveryType,
      user: user,
      stocks: stocks,
      deliveryTime: deliveryDate,
      address: address,
      location: location,
      entrance: entrance.isEmpty ? null : entrance.trim(),
      house: house.isEmpty ? null : house.trim(),
      floor: floor.isEmpty ? null : floor.trim(),
    );
    response.when(
      success: (data) async {
        state = state.copyWith(isCreating: false);
        orderSuccess?.call(data.data?.id ?? 0);
      },
      failure: (failure,status) {
        debugPrint('===> create order fail $failure');
        failed?.call(failure.toString());
        state = state.copyWith(isCreating: false);
      },
    );
  }
}
