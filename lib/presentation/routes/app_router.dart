import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../pages/generate_image/generate_image_page.dart';
import '../pages/pages.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    CupertinoRoute(path: '/', page: SplashRoute.page),
    CupertinoRoute(path: '/main', page: MainRoute.page),
    CupertinoRoute(path: '/login', page: LoginRoute.page),
    CupertinoRoute(path: '/order', page: OrderRoute.page),
    CupertinoRoute(path: '/income', page: IncomeRoute.page),
    CupertinoRoute(path: '/select-user', page: SelectUserRoute.page),
    CupertinoRoute(path: '/delivery-time', page: DeliveryTimeRoute.page),
    CupertinoRoute(path: '/order-history', page: OrderHistoryRoute.page),
    CupertinoRoute(path: '/delivery-zone', page: DeliveryZoneRoute.page),
    CupertinoRoute(path: '/no-connection', page: NoConnectionRoute.page),
    CupertinoRoute(path: '/select-address', page: SelectAddressRoute.page),
    CupertinoRoute(path: '/order-products', page: CreateOrderRoute.page),
    CupertinoRoute(path: '/shipping-address', page: ShippingAddressRoute.page),
    CupertinoRoute(path: '/list-notification', page: NotificationListRoute.page),
    CupertinoRoute(path: '/generate_image', page: GenerateImageRoute.page),
    CupertinoRoute(path: '/view_map', page: ViewMapRoute.page),
    CupertinoRoute(path: '/become_seller', page: CreateShopRoute.page),
    CupertinoRoute(path: '/search_map', page: MapSearchRoute.page),
  ];
}