import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../../infrastructure/models/models.dart';

class FoodKitchenItem extends StatelessWidget {
  final KitchenModel kitchen;
  final Function() onTap;
  final bool isSelected;

  const FoodKitchenItem({
    super.key,
    required this.kitchen,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Style.primaryColor : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Style.blackColor : Style.textColor,
                        width: isSelected ? 4 : 2,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    '${kitchen.translation?.title}',
                    style: Style.interRegular(
                      size: 15.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
