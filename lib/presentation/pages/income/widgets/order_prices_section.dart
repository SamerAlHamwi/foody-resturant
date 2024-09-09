import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../more_orders.dart';
import '../../../styles/style.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class OrderPricesSection extends StatelessWidget {
  const OrderPricesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(statisticsProvider);
      return Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.orderPrice),
                  style: Style.interNormal(
                    size: 14.sp,
                    color: Style.blackColor,
                    letterSpacing: -0.3,
                  ),
                ),
                16.verticalSpace,
                Text(
                  AppHelpers.numberFormat(
                      state.countData?.lastOrderTotalPrice ?? 0),
                  style: Style.interSemi(
                    size: 32.sp,
                    color: Style.blackColor,
                    letterSpacing: -0.3,
                  ),
                ),
                4.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: AppHelpers.getTranslation(TrKeys.lastIncome),
                    style: Style.interNormal(
                      size: 12.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                    children: [
                      TextSpan(
                        text: AppHelpers.numberFormat(
                            state.countData?.lastOrderIncome ?? 0),
                        style: Style.interSemi(
                          size: 12.sp,
                          color: Style.blackColor,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (MediaQuery.sizeOf(context).width - 40) / 2,
                decoration: BoxDecoration(
                  color: Style.blackColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: REdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.restaurantRevenue),
                      style: Style.interNormal(
                        size: 12.sp,
                        color: Style.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      AppHelpers.numberFormat(state.countData?.totalPrice ?? 0),
                      style: Style.interSemi(
                        size: 20.sp,
                        color: Style.white,
                        letterSpacing: -0.3,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: (MediaQuery.sizeOf(context).width - 40) / 2,
                decoration: BoxDecoration(
                  color: Style.blackColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: REdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.fMRevenue),
                      style: Style.interNormal(
                        size: 12.sp,
                        color: Style.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      AppHelpers.numberFormat(
                          state.countData?.fmTotalPrice ?? 0),
                      style: Style.interSemi(
                        size: 20.sp,
                        color: Style.white,
                        letterSpacing: -0.3,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          10.verticalSpace,
          GestureDetector(
            onTap: () {
              AppHelpers.showCustomModalBottomSheet(
                paddingTop: MediaQuery.paddingOf(context).top + 200.h,
                context: context,
                radius: 12,
                modal: const MoreOrders(),
                isDarkMode: true,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Style.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 2,
                    color: Style.blackColor.withOpacity(0.04),
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.moreAboutOrders),
                    style: Style.interNormal(
                      size: 14.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Icon(FlutterRemix.arrow_right_s_line)
                ],
              ),
            ),
          ),
          32.verticalSpace,
        ],
      );
    });
  }
}
