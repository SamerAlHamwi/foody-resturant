import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/application/restaurant/income/statistics/statistics_notifier.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../infrastructure/services/services.dart';

class AppbarScreen extends StatelessWidget {
  final StatisticsNotifier event;

  const AppbarScreen({super.key, required this.event}) ;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      bottomPadding: 16.h,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.income),
                  style: Style.interSemi(size: 18.sp),
                ),
                Text(
                  AppHelpers.getTranslation(TrKeys.earningsRestaurant),
                  style: Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                AppHelpers.showCustomModalBottomSheet(
                  paddingTop: MediaQuery.paddingOf(context).top,
                  context: context,
                  radius: 12,
                  modal: FilterScreen(
                    isTabBar: false,
                    onChangeDay: (rangeDatePicker) {
                      event.fetchStatistics(
                          startTime: rangeDatePicker.last ?? DateTime.now(),
                          endTime: rangeDatePicker.first ?? DateTime.now());
                    },
                  ),
                  isDarkMode: true,
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: const BoxDecoration(
                  color: Style.greyColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  FlutterRemix.calendar_event_fill,
                  color: Style.blackColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
