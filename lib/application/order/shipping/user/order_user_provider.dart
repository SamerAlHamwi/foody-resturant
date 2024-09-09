import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_user_state.dart';
import 'order_user_notifier.dart';
import '../../../../domain/di/dependency_manager.dart';

final orderUserProvider =
    StateNotifierProvider<OrderUserNotifier, OrderUserState>(
  (ref) => OrderUserNotifier(usersRepository),
);
