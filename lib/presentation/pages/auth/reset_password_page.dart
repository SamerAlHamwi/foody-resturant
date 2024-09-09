import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/infrastructure/models/data/user.dart';

import '../../styles/style.dart';
import 'register_confirmation_page.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key}) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(resetPasswordProvider.notifier);
    final state = ref.watch(resetPasswordProvider);
    final bool isDarkMode = LocalStorage.getAppThemeMode();
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: KeyboardDisable(
          child: Container(
            padding: MediaQuery.viewInsetsOf(context),
            decoration: BoxDecoration(
                color: Style.greyColor.withOpacity(0.96),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                )),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        AppBarBottomSheet(
                          title: AppHelpers.getTranslation(TrKeys.resetPassword),
                        ),
                        Text(
                          AppHelpers.getTranslation(TrKeys.resetPasswordText),
                          style: Style.interRegular(
                              size: 14.sp, color: Style.blackColor),
                        ),
                        40.verticalSpace,
                        UnderlinedTextField(
                          label: AppHelpers.getTranslation(TrKeys.email).toUpperCase(),
                          onChanged: notifier.setEmail,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.paddingOf(context).bottom,
                        top: 120.h,
                      ),
                      child: CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.send),
                        onPressed: () {
                          context.popRoute();
                          AppHelpers.showCustomModalBottomSheetWithoutIosIcon(
                            context: context,
                            modal: RegisterConfirmationPage(
                              userModel: UserModel(),
                              verificationId: '',
                            ),
                            isDarkMode: isDarkMode,
                          );
                        },
                        background: Style.primaryColor,
                        textColor: Style.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
