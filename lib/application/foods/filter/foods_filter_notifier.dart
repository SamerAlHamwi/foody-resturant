import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'foods_filter_state.dart';

class FoodsFilterNotifier extends StateNotifier<FoodsFilterState> {
  // final ShopsRepositoryFacade _shopsRepository;

  FoodsFilterNotifier(/*this._shopsRepository*/)
      : super(const FoodsFilterState());
  int shopIndex = 1;
  int marketRefreshIndex = 1;

  Future<void> setFilterModel(
      BuildContext context /*, FilterModel? data*/) async {
    // state = state.copyWith(filterModel: data);
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   state = state.copyWith(isLoading: true);
    //   final response = await _shopsRepository.getAllShops(1, filterModel: data);
    //   response.when(
    //     success: (data) async {
    //       state = state.copyWith(
    //           isLoading: false, shopCount: data.meta?.total ?? 0);
    //     },
    //     failure: (activeFailure, status) {
    //       state = state.copyWith(isLoading: false);
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }

  void clear() {
    // state = state.copyWith(filterModel: FilterModel(),rangeValues: RangeValues(1,state.endPrice));
  }

  Future<void> setCheck(BuildContext context, bool check) async {
    // state.filterModel?.isFreeDelivery = check;
    state = state.copyWith(checked: check);
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   state = state.copyWith(isLoading: true);
    //   final response =
    //   await _shopsRepository.getAllShops(1, filterModel: state.filterModel);
    //   response.when(
    //     success: (data) async {
    //       state = state.copyWith(
    //           isLoading: false, shopCount: data.meta?.total ?? 0);
    //     },
    //     failure: (activeFailure, status) {
    //       state = state.copyWith(isLoading: false);
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }

  void setRange(RangeValues values, BuildContext context) {
    // state.filterModel?.price = [values.start,values.end];
    // state = state.copyWith(rangeValues: RangeValues(values.start, values.end),filterModel: state.filterModel);
    // _delayed.run(() {
    //   setCheck(context,state.checked);
    // });
  }

  Future<void> init(BuildContext context) async {
    // state = state.copyWith(filterModel: FilterModel(), isTagLoading: true);
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   final response = await _shopsRepository.getTags();
    //   final res = await _shopsRepository.getSuggestPrice();
    //   response.when(
    //     success: (data) async {
    //       state = state.copyWith(
    //         tags: data.data ?? [],
    //       );
    //     },
    //     failure: (activeFailure, status) {
    //       state = state.copyWith(isTagLoading: false);
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    //   res.when(
    //     success: (data) async {
    //       state = state.copyWith(
    //           isTagLoading: false,
    //           endPrice: data.data.max,
    //           rangeValues: RangeValues(data.data.min, data.data.max-data.data.max/20),
    //           prices: List.generate((20).round(),
    //                   (index) => (Random().nextInt(8) + 1)));
    //     },
    //     failure: (activeFailure, status) {
    //       state = state.copyWith(isTagLoading: false);
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }

  Future<void> fetchRestaurant(BuildContext context) async {
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   state = state.copyWith(isRestaurantLoading: true);
    //   final response = await _shopsRepository.getAllShops(1,
    //       type: "restaurant", filterModel: state.filterModel);
    //   response.when(
    //     success: (data) async {
    //       state = state.copyWith(
    //           isRestaurantLoading: false, restaurant: data.data ?? []);
    //     },
    //     failure: (activeFailure, status) {
    //       state = state.copyWith(isRestaurantLoading: false);
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }

  Future<void> fetchRestaurantPage(
    BuildContext context,
    RefreshController shopController, {
    bool isRefresh = false,
  }) async {
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   if (isRefresh) {
    //     shopIndex = 1;
    //   }
    //   final response = await _shopsRepository.getAllShops(
    //       isRefresh ? 1 : ++shopIndex,
    //       type: "restaurant",
    //       filterModel: state.filterModel);
    //   response.when(
    //     success: (data) async {
    //       if (isRefresh) {
    //         state = state.copyWith(
    //           restaurant: data.data ?? [],
    //         );
    //         shopController.refreshCompleted();
    //       } else {
    //         if (data.data?.isNotEmpty ?? false) {
    //           List<ShopData> list = List.from(state.shops);
    //           list.addAll(data.data!);
    //           state = state.copyWith(
    //             restaurant: list,
    //           );
    //           shopController.loadComplete();
    //         } else {
    //           shopIndex--;
    //
    //           shopController.loadNoData();
    //         }
    //       }
    //     },
    //     failure: (activeFailure, status) {
    //       if (!isRefresh) {
    //         shopIndex--;
    //         shopController.loadFailed();
    //       } else {
    //         shopController.refreshFailed();
    //       }
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }

  Future<void> fetchFilterShop(BuildContext context) async {
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   state = state.copyWith(isShopLoading: true);
    //   final response = await _shopsRepository.getAllShops(1,
    //       type: "shop", filterModel: state.filterModel);
    //   response.when(
    //     success: (data) async {
    //       state = state.copyWith(isShopLoading: false, shops: data.data ?? []);
    //     },
    //     failure: (activeFailure, status) {
    //       state = state.copyWith(isShopLoading: false);
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }

  Future<void> fetchFilterShopPage(
    BuildContext context,
    RefreshController shopController, {
    bool isRefresh = false,
  }) async {
    // final connected = await AppConnectivity.connectivity();
    // if (connected) {
    //   if (isRefresh) {
    //     marketRefreshIndex = 1;
    //   }
    //   final response = await _shopsRepository.getAllShops(
    //       isRefresh ? 1 : ++marketRefreshIndex,
    //       type: "shop",
    //       filterModel: state.filterModel);
    //   response.when(
    //     success: (data) async {
    //       if (isRefresh) {
    //         state = state.copyWith(
    //           shops: data.data ?? [],
    //         );
    //         shopController.refreshCompleted();
    //       } else {
    //         if (data.data?.isNotEmpty ?? false) {
    //           List<ShopData> list = List.from(state.shops);
    //           list.addAll(data.data!);
    //           state = state.copyWith(
    //             shops: list,
    //           );
    //           shopController.loadComplete();
    //         } else {
    //           marketRefreshIndex--;
    //           shopController.loadNoData();
    //         }
    //       }
    //     },
    //     failure: (activeFailure, status) {
    //       if (!isRefresh) {
    //         marketRefreshIndex--;
    //         shopController.loadFailed();
    //       } else {
    //         shopController.refreshFailed();
    //       }
    //       AppHelpers.showCheckTopSnackBar(
    //         context,
    //         AppHelpers.getTranslation(status.toString()),
    //       );
    //     },
    //   );
    // } else {
    //   if (context.mounted) {
    //     AppHelpers.showNoConnectionSnackBar(context);
    //   }
    // }
  }
}
