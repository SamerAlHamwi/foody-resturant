import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class FoodStockItem extends StatelessWidget {
  final Stock stock;
  final Function() onDelete;

  const FoodStockItem({super.key, required this.stock, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      margin: REdgeInsets.only(bottom: 1),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.12,
          motion: const ScrollMotion(),
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Slidable.of(context)?.close();
                      onDelete();
                    },
                    child: Container(
                      width: 50.r,
                      height: 78.r,
                      decoration: BoxDecoration(
                        color: Style.redColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          bottomLeft: Radius.circular(16.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        FlutterRemix.close_fill,
                        color: Style.white,
                        size: 24.r,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            if ((stock.cartCount ?? 0) > 0)
              Container(
                width: 50.r,
                height: 78.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  color: Style.primaryColor,
                ),
                child: Text(
                  '${(stock.cartCount ?? 1) * (stock.product?.interval ?? 1)} ${stock.product?.unit?.translation?.title ?? ""}',
                  style: Style.interSemi(size: 15.sp),
                ),
              ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.product?.translation?.title ?? '',
                    style: Style.interNormal(
                      size: 14.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    stock.product?.translation?.description ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Style.interNormal(
                      size: 12.sp,
                      color: Style.textColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                  ...?stock.addons?.where((e) => e.active ?? false).map((e) => Padding(
                    padding:  REdgeInsets.only(right: 4,top: 4),
                    child: Row(
                      children: [
                        Text(
                              e.product?.translation?.title ?? '',
                              style: Style.interNormal(
                                size: 12.sp,
                                color: Style.textColor,
                                letterSpacing: -0.3,
                              ),
                            ),
                        Text(
                              "  ${AppHelpers.numberFormat(e.product?.stock?.totalPrice)} x ${e.quantity ?? 1}",
                              style: Style.interNormal(
                                size: 12.sp,
                                color: Style.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                      ],
                    ),
                  )),
                  8.verticalSpace,
                  Text(
                    AppHelpers.numberFormat(stock.totalPrice),
                    style: Style.interSemi(
                      size: 14.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),
            8.horizontalSpace,
            CommonImage(
              width: 110,
              height: 106,
              url: stock.product?.img,
              radius: 0,
              errorRadius: 0,
              fit: BoxFit.fitWidth,
            ),
            16.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
