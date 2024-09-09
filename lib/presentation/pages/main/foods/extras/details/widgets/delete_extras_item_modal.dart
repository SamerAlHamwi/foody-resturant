import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../styles/style.dart';
import '../../../../../../component/components.dart';
import '../../../../../../../application/providers.dart';
import '../../../../../../../infrastructure/models/models.dart';
import '../../../../../../../infrastructure/services/services.dart';

class DeleteExtrasItemModal extends StatelessWidget {
  final Extras extras;

  const DeleteExtrasItemModal({super.key, required this.extras})
      ;

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            40.verticalSpace,
            Text(
              '${AppHelpers.getTranslation(TrKeys.areYouSureToDelete)} ${extras.value}?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                color: Style.blackColor,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.02,
              ),
            ),
            36.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: AppHelpers.getTranslation(TrKeys.cancel),
                    onPressed: context.popRoute,
                    background: Style.transparent,
                    borderColor: Style.blackColor,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.yes),
                        isLoading:
                            ref.watch(deleteExtrasItemProvider).isLoading,
                        onPressed: () => ref
                            .read(deleteExtrasItemProvider.notifier)
                            .deleteExtrasItem(
                          context,
                          extrasId: extras.id,
                          success: () {
                            ref
                                .read(extrasGroupDetailsProvider.notifier)
                                .fetchGroupExtras(groupId: extras.extraGroupId);
                            context.popRoute();
                          },
                        ),
                        background: Style.redColor,
                        borderColor: Style.redColor,
                        textColor: Style.white,
                      );
                    },
                  ),
                ),
              ],
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
