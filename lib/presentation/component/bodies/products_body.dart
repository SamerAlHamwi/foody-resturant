import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../../infrastructure/models/models.dart';

class ProductsBody extends StatelessWidget {
  final RefreshController refreshController;
  final int bottomPadding;
  final bool isLoading;
  final int itemSpacing;
  final List<ProductData> products;
  final Function(int) onProductTap;
  final Function() onLoading;
  final Function() onRefreshing;
  final bool isOrderFoods;
  final int loadingHeight;
  final ScrollPhysics scrollPhysics;

  const ProductsBody({
    super.key,
    required this.refreshController,
    required this.isLoading,
    required this.products,
    required this.onProductTap,
    required this.onLoading,
    required this.onRefreshing,
    this.itemSpacing = 1,
    this.bottomPadding = 72,
    this.isOrderFoods = false,
    this.loadingHeight = 188,
    this.scrollPhysics = const BouncingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingList(
            verticalPadding: 16,
            itemBorderRadius: 0,
            itemPadding: itemSpacing,
            itemHeight: loadingHeight,
          )
        : SmartRefresher(
            controller: refreshController,
            physics: scrollPhysics,
            enablePullDown: true,
            enablePullUp: true,
            onLoading: onLoading,
            onRefresh: onRefreshing,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: REdgeInsets.only(top: 16, bottom: bottomPadding.r),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) => isOrderFoods
                  ? OrderFoodItem(
                      product: products[index],
                      onTap: () => onProductTap(index),
                      spacing: itemSpacing,
                    )
                  : FoodItem(
                      product: products[index],
                      spacing: itemSpacing,
                      onTap: () => onProductTap(index),
                    ),
            ),
          );
  }
}
