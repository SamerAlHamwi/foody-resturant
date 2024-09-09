import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:venderfoodyman/domain/interface/notification.dart';
import 'package:venderfoodyman/infrastructure/repositories/notification_repository.dart';
import 'package:venderfoodyman/infrastructure/repositories/shops_repository_impl.dart';

import '../../infrastructure/services/local_storage.dart';
import '../handlers/handlers.dart';
import '../interface/interfaces.dart';
import 'package:venderfoodyman/presentation/routes/app_router.dart';
import '../../infrastructure/repositories/repositories.dart';

final GetIt getIt = GetIt.instance;

Future setUpDependencies() async {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<UsersRepository>(UsersRepositoryImpl());
  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  getIt.registerSingleton<CatalogRepository>(CatalogRepositoryImpl());
  getIt.registerSingleton<ShopsRepository>(ShopsRepositoryImpl());
  getIt.registerSingleton<Map>(LocalStorage.getTranslations());
  getIt.registerSingleton<NotificationRepositoryFacade>(NotificationRepositoryImpl());

}

final notificationRepo = getIt.get<NotificationRepositoryFacade>();
final settingsRepository = getIt.get<SettingsRepository>();
final authRepository = getIt.get<AuthRepository>();
final usersRepository = getIt.get<UsersRepository>();
final productRepository = getIt.get<ProductsRepository>();
final appRouter = getIt.get<AppRouter>();
final googlePlace = getIt.get<GooglePlace>();
final ordersRepository = getIt.get<OrdersRepository>();
final catalogRepository = getIt.get<CatalogRepository>();
final shopsRepository = getIt.get<ShopsRepository>();
final translation = getIt.get<Map>();