import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../styles/style.dart';
import 'widgets/delivery_type_item.dart';
import '../../../../component/components.dart';
import 'package:venderfoodyman/presentation/routes/app_router.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

@RoutePage()
class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  late TextEditingController _userTextController;

  @override
  void initState() {
    super.initState();
    _userTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Style.greyColor,
        body: Container(
          padding: MediaQuery.viewInsetsOf(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    children: [
                      24.verticalSpace,
                      TitleAndIcon(
                        title: AppHelpers.getTranslation(
                            TrKeys.customerInformation),
                      ),
                      24.verticalSpace,
                      Consumer(
                        builder: (context, ref, child) {
                          final userState = ref.watch(orderUserProvider);
                          final userNotifier =
                              ref.read(orderUserProvider.notifier);
                          return Column(
                            children: [
                              UnderlinedTextField(
                                label: userState.selectedUser != null
                                    ? AppHelpers.getTranslation(
                                        TrKeys.selectedUser)
                                    : AppHelpers.getTranslation(
                                        TrKeys.pleaseSelectAUser),
                                readOnly: true,
                                onTap: () =>
                                    context.pushRoute(const SelectUserRoute()),
                                textController: userState.userTextController,
                                descriptionText: userState.selectedUser == null
                                    ? null
                                    : '${userState.selectedUser?.email}',
                              ),
                              16.verticalSpace,
                              if (AppConstants.isSpecificNumberEnabled)
                                IntlPhoneField(
                                  disableLengthCheck: !AppConstants.isNumberLengthAlwaysSame,

                                  onChanged: (phoneNum) {
                                    userNotifier
                                        .setPhone(phoneNum.completeNumber);
                                  },
                                  validator: (s) {
                                    if (AppConstants.isNumberLengthAlwaysSame &&
                                        (s?.isValidNumber() ?? true)) {
                                      return AppHelpers.getTranslation(
                                          TrKeys.phoneNumberIsNotValid);
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  initialCountryCode:
                                      AppConstants.countryCodeISO,
                                  invalidNumberMessage:
                                      AppHelpers.getTranslation(
                                          TrKeys.phoneNumberIsNotValid),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  showCountryFlag: AppConstants.showFlag,
                                  showDropdownIcon: AppConstants.showArrowIcon,
                                  autovalidateMode:
                                      AppConstants.isNumberLengthAlwaysSame
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.merge(
                                            const BorderSide(
                                                color: Style.differBorderColor),
                                            const BorderSide(
                                                color:
                                                    Style.differBorderColor))),
                                    errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.merge(
                                            const BorderSide(
                                                color: Style.differBorderColor),
                                            const BorderSide(
                                                color:
                                                    Style.differBorderColor))),
                                    border: const UnderlineInputBorder(),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(),
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.merge(
                                            const BorderSide(
                                                color: Style.differBorderColor),
                                            const BorderSide(
                                                color:
                                                    Style.differBorderColor))),
                                    focusedBorder: const UnderlineInputBorder(),
                                  ),
                                ),
                              if (!AppConstants.isSpecificNumberEnabled)
                                UnderlinedTextField(
                                  label: TrKeys.phoneNumber,
                                  onChanged: (value) =>
                                      userNotifier.setPhone(value),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final addressEvent =
                          ref.read(orderAddressProvider.notifier);
                      final addressState = ref.watch(orderAddressProvider);
                      return Column(
                        children: [
                          TitleAndIcon(
                            title: AppHelpers.getTranslation(
                                TrKeys.shippingAddress),
                          ),
                          24.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  label: AppHelpers.getTranslation(
                                      TrKeys.selectedAddress),
                                  textController: addressState.textController,
                                  readOnly: true,
                                ),
                              ),
                              10.horizontalSpace,
                              ButtonsBouncingEffect(
                                child: GestureDetector(
                                  onTap: () => context
                                      .pushRoute(const SelectAddressRoute()),
                                  child: Container(
                                    width: 40.r,
                                    height: 40.r,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Style.primaryColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      FlutterRemix.map_pin_add_fill,
                                      size: 24.r,
                                      color: Style.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  label: AppHelpers.getTranslation(
                                      TrKeys.entrance),
                                  onChanged: addressEvent.setEntrance,
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      AppHelpers.getTranslation(TrKeys.floor),
                                  onChanged: addressEvent.setFloor,
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      AppHelpers.getTranslation(TrKeys.house),
                                  onChanged: addressEvent.setHouse,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                Consumer(
                  builder: (context, ref, child) {
                    final deliveryEvent =
                        ref.read(deliveryTypeProvider.notifier);
                    final deliveryState = ref.watch(deliveryTypeProvider);
                    return Container(
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: REdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          TitleAndIcon(
                            title:
                                AppHelpers.getTranslation(TrKeys.deliveryType),
                          ),
                          24.verticalSpace,
                          DeliveryTypeItem(
                            iconData: FlutterRemix.takeaway_fill,
                            title: AppHelpers.getTranslation(
                                TrKeys.deliveryService),
                            desc:
                                '${AppHelpers.getTranslation(TrKeys.estimatedTime)} 25 - 30 min',
                            isActive:
                                deliveryState.type == DeliveryType.delivery,
                            onTap: () =>
                                deliveryEvent.setType(DeliveryType.delivery),
                          ),
                          8.verticalSpace,
                          DeliveryTypeItem(
                            iconData: FlutterRemix.walk_fill,
                            title: AppHelpers.getTranslation(TrKeys.takeAway),
                            desc:
                                '${AppHelpers.getTranslation(TrKeys.approximateTime)} 25 - 30 min',
                            isActive: deliveryState.type == DeliveryType.pickup,
                            onTap: () =>
                                deliveryEvent.setType(DeliveryType.pickup),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: REdgeInsets.all(16),
          child: Consumer(
            builder: (context, ref, child) => Row(
              children: [
                const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
                8.horizontalSpace,
                if (ref.watch(orderUserProvider).selectedUser != null &&
                    ref.watch(orderUserProvider).selectedUser?.phone != null)
                  Expanded(
                    child: CustomButton(
                      title: AppHelpers.getTranslation(TrKeys.next),
                      onPressed: () {
                        if (ref.watch(deliveryTypeProvider).type ==
                            DeliveryType.delivery) {
                          if (ref.watch(orderAddressProvider).location ==
                              null) {
                            AppHelpers.showCheckTopSnackBar(context,
                                type: SnackBarType.info,
                                text: TrKeys.selectedAddress);
                            return;
                          }
                          context.pushRoute(const DeliveryTimeRoute());
                          return;
                        }
                        context.pushRoute(const DeliveryTimeRoute());
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
