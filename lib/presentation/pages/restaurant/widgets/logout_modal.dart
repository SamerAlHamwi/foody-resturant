import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/application/profile/profile_provider.dart';
import '../../../styles/style.dart';
import 'package:venderfoodyman/presentation/routes/app_router.dart';
import '../../../component/components.dart';
import '../../../../infrastructure/services/services.dart';
class LogoutModal extends StatelessWidget {
  final bool isDeleteAccount;

  const LogoutModal({super.key, this.isDeleteAccount = false}) ;

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            12.verticalSpace,
            Text(
              AppHelpers.getTranslation(isDeleteAccount
                  ? TrKeys.areYouSure
                  : TrKeys.doYouReallyWantToLogout),
              style: Style.interSemi(size: 16.sp),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      borderColor: Style.black,
                      background: Style.transparent,
                      title: AppHelpers.getTranslation(TrKeys.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    if (isDeleteAccount) {
                      return CustomButton(
                          background: Style.redColor,
                          textColor: Style.white,
                          title: AppHelpers.getTranslation(TrKeys.deleteAccount),
                          onPressed: () {
                            ref
                                .read(profileProvider.notifier)
                                .deleteAccount(context);
                          });
                    } else {
                      return CustomButton(
                          title: AppHelpers.getTranslation(TrKeys.logout),
                          onPressed: () {
                            final GoogleSignIn signIn = GoogleSignIn();
                            signIn.disconnect();
                            signIn.signOut();
                            LocalStorage.logout();
                            context.router.popUntilRoot();
                            context.replaceRoute(const LoginRoute());
                          });
                    }
                  }),
                ),
              ],
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
