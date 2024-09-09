import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'accepted_orders_state.dart';
import 'accepted_orders_notifier.dart';
import '../../../../domain/di/dependency_manager.dart';

final acceptedOrdersProvider =
    StateNotifierProvider<AcceptedOrdersNotifier, AcceptedOrdersState>(
  (ref) => AcceptedOrdersNotifier(ordersRepository),
);
