import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_order_state.dart';
import 'create_order_notifier.dart';
import '../../domain/di/dependency_manager.dart';

final createOrderProvider =
    StateNotifierProvider<CreateOrderNotifier, CreateOrderState>(
  (ref) => CreateOrderNotifier(ordersRepository),
);
