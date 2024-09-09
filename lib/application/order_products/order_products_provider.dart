import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_products_state.dart';
import 'order_products_notifier.dart';
import '../../domain/di/dependency_manager.dart';

final orderProductsProvider =
    StateNotifierProvider<OrderProductsNotifier, OrderProductsState>(
  (ref) => OrderProductsNotifier(productRepository),
);
