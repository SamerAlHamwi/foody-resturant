import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class CreateFoodEditExtrasModal extends ConsumerStatefulWidget {
  final int groupIndex;

  const CreateFoodEditExtrasModal({super.key, required this.groupIndex})
      ;

  @override
  ConsumerState<CreateFoodEditExtrasModal> createState() =>
      _CreateFoodEditExtrasModalState();
}

class _CreateFoodEditExtrasModalState
    extends ConsumerState<CreateFoodEditExtrasModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(createFoodStocksProvider.notifier)
          .fetchGroupExtras(context, groupIndex: widget.groupIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ModalDrag(),
              TitleAndIcon(
                title: AppHelpers.getTranslation(TrKeys.extras),
                titleSize: 16,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(createFoodStocksProvider);
                  final event = ref.read(createFoodStocksProvider.notifier);
                  return state.isLoading
                      ? Padding(
                          padding: REdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3.r,
                              color: Style.primaryColor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: REdgeInsets.symmetric(vertical: 20),
                          shrinkWrap: true,
                          itemCount: state.activeGroupExtras.length,
                          itemBuilder: (context, index) {
                            return GroupExtrasItem(
                              extras: state.activeGroupExtras[index],
                              onTap: () => event.setActiveExtrasIndex(
                                itemIndex: index,
                                groupIndex: widget.groupIndex,
                              ),
                              isSelected: state.selectGroups.values.any(
                                  (element) => element.any((element) =>
                                      element?.id ==
                                      state.activeGroupExtras[index].id)),
                            );
                          },
                        );
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
