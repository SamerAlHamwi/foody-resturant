import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/application/foods/edit/details/kitchen/edit_food_kitchens_provider.dart';
import 'package:venderfoodyman/presentation/component/helper/multi_image_picker.dart';
import 'package:venderfoodyman/presentation/pages/main/foods/edit/details/edit_food_kitchens_modal.dart';

import 'edit_food_units_modal.dart';
import 'edit_food_categories_modal.dart';
import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class EditFoodDetailsBody extends StatefulWidget {
  final Function() onSave;
  final ScrollController controller;

  const EditFoodDetailsBody(
      {super.key, required this.onSave, required this.controller})
      ;

  @override
  State<EditFoodDetailsBody> createState() => _EditFoodDetailsBodyState();
}

class _EditFoodDetailsBodyState extends State<EditFoodDetailsBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          controller: widget.controller,
          physics: const BouncingScrollPhysics(),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(editFoodDetailsProvider);
              final categoryState = ref.watch(editFoodCategoriesProvider);
              final unitState = ref.watch(editFoodUnitsProvider);
              final kitchenState = ref.watch(editFoodKitchensProvider);
              final event = ref.read(editFoodDetailsProvider.notifier);
              final foodsEvent = ref.read(foodsProvider.notifier);
              return state.product == null
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.r,
                        color: Style.primaryColor,
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          24.verticalSpace,
                          state.isLoading? const Loading(): MultiImagePicker(
                            imageUrls: state.listOfUrls,
                            listOfImages: state.images,
                            onImageChange: event.setImageFile,
                            onDelete: event.deleteImage,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            label: '${AppHelpers.getTranslation(TrKeys.productTitle)}*',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setTitle,
                            initialText: state.product?.translation?.title,
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            label: '${AppHelpers.getTranslation(TrKeys.description)}*',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setDescription,
                            initialText:
                                state.product?.translation?.description,
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            textController: categoryState.categoriesController,
                            label:
                                '${AppHelpers.getTranslation(TrKeys.productCategory)}*',
                            suffixIcon: Icon(
                              FlutterRemix.arrow_down_s_line,
                              color: Style.blackColor,
                              size: 18.r,
                            ),
                            readOnly: true,
                            onTap: () => AppHelpers.showCustomModalBottomSheet(
                              paddingTop:
                                  MediaQuery.paddingOf(context).top + 100.h,
                              context: context,
                              modal: const EditFoodCategoriesModal(),
                              isDarkMode: false,
                            ),
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            textController: unitState.unitController,
                            label: '${AppHelpers.getTranslation(TrKeys.units)}*',
                            suffixIcon: Icon(
                              FlutterRemix.arrow_down_s_line,
                              color: Style.blackColor,
                              size: 18.r,
                            ),
                            readOnly: true,
                            onTap: () => AppHelpers.showCustomModalBottomSheet(
                              paddingTop:
                                  MediaQuery.paddingOf(context).top + 250.h,
                              context: context,
                              modal: const EditFoodUnitsModal(),
                              isDarkMode: false,
                            ),
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            textController: kitchenState.kitchenController,
                            label: AppHelpers.getTranslation(TrKeys.kitchen),
                            suffixIcon: Icon(
                              FlutterRemix.arrow_down_s_line,
                              color: Style.blackColor,
                              size: 18.r,
                            ),
                            readOnly: true,
                            onTap: () => AppHelpers.showCustomModalBottomSheet(
                              paddingTop:
                                  MediaQuery.paddingOf(context).top + 250.h,
                              context: context,
                              modal: const EditFoodKitchensModal(),
                              isDarkMode: false,
                            ),
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            label: '${AppHelpers.getTranslation(TrKeys.interval)}*',
                            inputType: TextInputType.number,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setTitle,
                            initialText:
                                (state.product?.interval ?? 1).toString(),
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      '${AppHelpers.getTranslation(TrKeys.minQuantity)}*',
                                  inputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialText:
                                      state.product?.minQty.toString() ?? '',
                                  onChanged: event.setMinQty,
                                  validator: AppValidators.emptyCheck,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      '${AppHelpers.getTranslation(TrKeys.maxQuantity)}*',
                                  inputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialText:
                                      state.product?.maxQty.toString() ?? '',
                                  onChanged: event.setMaxQty,
                                  validator: (value) =>
                                      AppValidators.maxQtyCheck(
                                          value, state.minQty),
                                ),
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            label: '${AppHelpers.getTranslation(TrKeys.tax)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            initialText: state.product?.tax == null
                                ? ''
                                : state.product?.tax.toString(),
                            onChanged: event.setTax,
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.showProduct),
                                style: Style.interNormal(
                                  size: 14.sp,
                                  letterSpacing: -0.3,
                                  color: Style.blackColor,
                                ),
                              ),
                              CustomToggle(
                                controller: ValueNotifier<bool>(
                                  state.product?.active ?? false,
                                ),
                                onChange: event.setActive,
                              ),
                            ],
                          ),
                          40.verticalSpace,
                          CustomButton(
                            title: AppHelpers.getTranslation(TrKeys.save),
                            isLoading: state.isLoading,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                event.updateProduct(
                                  context,
                                  unit: unitState.foodUnit,
                                  kitchen: kitchenState.foodKitchen,
                                  category: categoryState.foodCategory,
                                  updated: (product) {
                                    widget.onSave();
                                    AppHelpers.showCheckTopSnackBar(
                                      context,
                                      text: AppHelpers.getTranslation(
                                          TrKeys.successfullyUpdated),
                                      type: SnackBarType.success,
                                    );
                                    foodsEvent.updateSingleProduct(product);
                                  },
                                  failed: () => AppHelpers.showCheckTopSnackBar(
                                    context,
                                    text: AppHelpers.getTranslation(TrKeys.updateFailed),
                                    type: SnackBarType.error,
                                  ),
                                );
                              }
                            },
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
