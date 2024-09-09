// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateOrderPage(),
      );
    },
    CreateShopRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateShopPage(),
      );
    },
    DeliveryTimeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryTimePage(),
      );
    },
    DeliveryZoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryZonePage(),
      );
    },
    GenerateImageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GenerateImagePage(),
      );
    },
    IncomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IncomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MapSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapSearchPage(),
      );
    },
    NoConnectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoConnectionPage(),
      );
    },
    NotificationListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationListPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderHistoryPage(),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPage(),
      );
    },
    SelectAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectAddressPage(),
      );
    },
    SelectUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectUserPage(),
      );
    },
    ShippingAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShippingAddressPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    ViewMapRoute.name: (routeData) {
      final args = routeData.argsAs<ViewMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewMapPage(
          args.onChanged,
          key: args.key,
          isShopLocation: args.isShopLocation,
          shopId: args.shopId,
        ),
      );
    },
  };
}

/// generated route for
/// [CreateOrderPage]
class CreateOrderRoute extends PageRouteInfo<void> {
  const CreateOrderRoute({List<PageRouteInfo>? children})
      : super(
          CreateOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateShopPage]
class CreateShopRoute extends PageRouteInfo<void> {
  const CreateShopRoute({List<PageRouteInfo>? children})
      : super(
          CreateShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateShopRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryTimePage]
class DeliveryTimeRoute extends PageRouteInfo<void> {
  const DeliveryTimeRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryTimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryTimeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryZonePage]
class DeliveryZoneRoute extends PageRouteInfo<void> {
  const DeliveryZoneRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryZoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryZoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GenerateImagePage]
class GenerateImageRoute extends PageRouteInfo<void> {
  const GenerateImageRoute({List<PageRouteInfo>? children})
      : super(
          GenerateImageRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateImageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IncomePage]
class IncomeRoute extends PageRouteInfo<void> {
  const IncomeRoute({List<PageRouteInfo>? children})
      : super(
          IncomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapSearchPage]
class MapSearchRoute extends PageRouteInfo<void> {
  const MapSearchRoute({List<PageRouteInfo>? children})
      : super(
          MapSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoConnectionPage]
class NoConnectionRoute extends PageRouteInfo<void> {
  const NoConnectionRoute({List<PageRouteInfo>? children})
      : super(
          NoConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoConnectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationListPage]
class NotificationListRoute extends PageRouteInfo<void> {
  const NotificationListRoute({List<PageRouteInfo>? children})
      : super(
          NotificationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderHistoryPage]
class OrderHistoryRoute extends PageRouteInfo<void> {
  const OrderHistoryRoute({List<PageRouteInfo>? children})
      : super(
          OrderHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectAddressPage]
class SelectAddressRoute extends PageRouteInfo<void> {
  const SelectAddressRoute({List<PageRouteInfo>? children})
      : super(
          SelectAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectUserPage]
class SelectUserRoute extends PageRouteInfo<void> {
  const SelectUserRoute({List<PageRouteInfo>? children})
      : super(
          SelectUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShippingAddressPage]
class ShippingAddressRoute extends PageRouteInfo<void> {
  const ShippingAddressRoute({List<PageRouteInfo>? children})
      : super(
          ShippingAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShippingAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewMapPage]
class ViewMapRoute extends PageRouteInfo<ViewMapRouteArgs> {
  ViewMapRoute({
    required void Function() onChanged,
    Key? key,
    bool isShopLocation = false,
    int? shopId,
    List<PageRouteInfo>? children,
  }) : super(
          ViewMapRoute.name,
          args: ViewMapRouteArgs(
            onChanged: onChanged,
            key: key,
            isShopLocation: isShopLocation,
            shopId: shopId,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewMapRoute';

  static const PageInfo<ViewMapRouteArgs> page =
      PageInfo<ViewMapRouteArgs>(name);
}

class ViewMapRouteArgs {
  const ViewMapRouteArgs({
    required this.onChanged,
    this.key,
    this.isShopLocation = false,
    this.shopId,
  });

  final void Function() onChanged;

  final Key? key;

  final bool isShopLocation;

  final int? shopId;

  @override
  String toString() {
    return 'ViewMapRouteArgs{onChanged: $onChanged, key: $key, isShopLocation: $isShopLocation, shopId: $shopId}';
  }
}
