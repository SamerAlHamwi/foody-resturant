import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class EditFoodCategoriesModal extends ConsumerStatefulWidget {
  const EditFoodCategoriesModal({super.key}) ;

  @override
  ConsumerState<EditFoodCategoriesModal> createState() =>
      _EditFoodCategoriesScreenState();
}

class _EditFoodCategoriesScreenState
    extends ConsumerState<EditFoodCategoriesModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editFoodCategoriesProvider.notifier)
          .setCategories(ref.watch(foodCategoriesProvider).categories),
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
                title: AppHelpers.getTranslation(TrKeys.categories),
                titleSize: 16,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(editFoodCategoriesProvider);
                  final event = ref.read(editFoodCategoriesProvider.notifier);
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => FoodCategoryItem(
                      category: state.categories[index],
                      onTap: () {
                        event.setActiveIndex(index);
                        Navigator.pop(context);
                      },
                      isSelected: state.activeIndex == index,
                    ),
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
