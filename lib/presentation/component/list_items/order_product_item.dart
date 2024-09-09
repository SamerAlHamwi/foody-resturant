import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../loading/text_loading.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class OrderProductItem extends StatelessWidget {
  final CurrencyData? currencyData;
  final OrderDetail orderDetail;
  final bool isLast;
  final bool isLoading;
  final Function() onToggle;

  const OrderProductItem({
    super.key,
    required this.orderDetail,
    required this.isLoading,
    required this.onToggle,
    this.isLast = false,
    required this.currencyData,
  });

  @override
  Widget build(BuildContext context) {
    num totalPrice = 0;
    totalPrice += (orderDetail.totalPrice ?? 0);
    orderDetail.addons?.forEach((element) {
      totalPrice += (element.totalPrice ?? 0);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onToggle,
                  child: (orderDetail.isChecked ?? false)
                      ? Icon(
                          FlutterRemix.checkbox_circle_fill,
                          size: 24.r,
                          color: Style.primaryColor,
                        )
                      : Icon(
                          FlutterRemix.checkbox_blank_circle_line,
                          size: 24.r,
                          color: Style.blackColor,
                        ),
                ),
                14.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading
                        ? const TextLoading(width: 200)
                        : SizedBox(
                            width: MediaQuery.sizeOf(context).width - 180.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderDetail
                                          .stock?.product?.translation?.title ??
                                      AppHelpers.getTranslation(TrKeys.noName),
                                  style: Style.interSemi(
                                      size: 14.sp, color: Style.blackColor),
                                ),
                                for (int i = 0;
                                    i < (orderDetail.addons?.length ?? 0);
                                    i++)
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: Text(
                                      "${orderDetail.addons?[i].stock?.product?.translation?.title} x ${orderDetail.addons?[i].quantity ?? 0}  ${AppHelpers.numberFormat( orderDetail.addons?[i].stock?.totalPrice ?? 0, symbol: currencyData?.symbol)}",
                                      style: Style.interSemi(
                                          size: 12.sp, color: Style.blackColor),
                                    ),
                                  )
                              ],
                            ),
                          ),
                    4.verticalSpace,
                    isLoading
                        ? const TextLoading(width: 150)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${AppHelpers.getTranslation(TrKeys.amount)} — ${orderDetail.quantity} x ${AppHelpers.numberFormat( orderDetail.stock?.totalPrice ?? 0, symbol: currencyData?.symbol)}',
                                style: Style.interRegular(
                                  size: 14.sp,
                                  color: Style.blackColor,
                                ),
                              ),
                              Text(
                                "${(orderDetail.quantity ?? 1) * (orderDetail.stock?.product?.interval ?? 1)} ${orderDetail.stock?.product?.unit?.translation?.title ?? ""}",
                                style: Style.interSemi(
                                    size: 12.sp, color: Style.textColor),
                              ),
                            ],
                          ),
                  ],
                ),
              ],
            ),
            Text(
              AppHelpers.numberFormat(
                   totalPrice, symbol: currencyData?.symbol),
              style: Style.interSemi(size: 14.sp, color: Style.blackColor),
            ),
          ],
        ),
        16.verticalSpace,
        if (!isLast)
          Divider(thickness: 1.r, height: 1.r, color: Style.greyColor),
        if (orderDetail.note != '') 5.verticalSpace,
        if (orderDetail.note != '') Text(
          "${AppHelpers.getTranslation(TrKeys.note)}: ${orderDetail.note}",
          style: Style.interRegular(
            size: 14.sp,
            color: Style.blackColor,
          ),
        )
      ],
    );
  }
}
