import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/payment_item.dart';
import '../../../../../styles/style.dart';
import '../../order/widgets/title_price.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

@RoutePage()
class DeliveryTimePage extends ConsumerStatefulWidget {
  const DeliveryTimePage({super.key});

  @override
  ConsumerState<DeliveryTimePage> createState() => _DeliveryTimePageState();
}

class _DeliveryTimePageState extends ConsumerState<DeliveryTimePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderPaymentProvider.notifier)
          ..fetchPayments()
          ..getCalculate(
            stocks: ref.watch(orderCartProvider).stocks,
            type: ref.watch(deliveryTypeProvider).type == DeliveryType.delivery
                ? 'delivery'
                : 'pickup',
            location: ref.watch(orderAddressProvider).location,
          );
      },
    );
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
            padding: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom + 48.h,
            ),
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      padding: REdgeInsets.only(
                        top: MediaQuery.paddingOf(context).top + 26,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final timeState = ref.watch(deliveryTimeProvider);
                          final timeEvent =
                              ref.read(deliveryTimeProvider.notifier);
                          return Column(
                            children: [
                              TitleAndIcon(
                                title: AppHelpers.getTranslation(
                                    TrKeys.deliveryTime),
                              ),
                              24.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppHelpers.getTranslation(
                                        TrKeys.selectedTimeAndDay),
                                    style: Style.interSemi(
                                        size: 14.sp, letterSpacing: -0.3),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        AppHelpers.showCustomModalBottomSheet(
                                      paddingTop:
                                          MediaQuery.paddingOf(context).top,
                                      context: context,
                                      radius: 12,
                                      modal: SelectDateModal(
                                        initialDate: timeState.deliveryDate,
                                        onDateSaved: (date) =>
                                            timeEvent.setDeliveryDate(
                                          date.toString().substring(0, 10),
                                        ),
                                      ),
                                      isDarkMode: true,
                                    ),
                                    child: Text(
                                      timeState.deliveryDate,
                                      style: Style.interNormal(
                                          size: 14.sp, letterSpacing: -0.3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
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
                            title: AppHelpers.getTranslation(TrKeys.payment),
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final paymentState =
                                  ref.watch(orderPaymentProvider);
                              final paymentEvent =
                                  ref.watch(orderPaymentProvider.notifier);
                              return paymentState.isLoading
                                  ? Container(
                                      width: 30.r,
                                      height: 30.r,
                                      margin:
                                          REdgeInsets.symmetric(vertical: 20),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3.r,
                                          color: Style.primaryColor,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: paymentState.payments.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          PaymentItem(
                                        payment: paymentState.payments[index],
                                        isSelected:
                                            paymentState.selectedIndex == index,
                                        isLast: paymentState.payments.length ==
                                            index + 1,
                                        onTap: () => paymentEvent
                                            .setSelectedIndex(index),
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Consumer(builder: (context, ref, child) {
                  final state = ref.watch(orderPaymentProvider);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: state.isCalculateLoading
                        ? const Loading()
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: TitleAndIcon(
                                  title:
                                      "${AppHelpers.getTranslation(TrKeys.payment)} - \$",
                                ),
                              ),
                              24.verticalSpace,
                              TitleAndPrice(
                                title:
                                    AppHelpers.getTranslation(TrKeys.subtotal),
                                rightTitle: AppHelpers.numberFormat(
                                    state.orderCalculate?.price ?? 0),
                                textStyle: Style.interRegular(
                                  size: 16,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              16.verticalSpace,
                              TitleAndPrice(
                                title: AppHelpers.getTranslation(
                                    TrKeys.deliveryPrice),
                                rightTitle: AppHelpers.numberFormat(
                                    state.orderCalculate?.deliveryFee ?? 0),
                                textStyle: Style.interRegular(
                                    size: 16, letterSpacing: -0.3),
                              ),
                              16.verticalSpace,
                              TitleAndPrice(
                                title: AppHelpers.getTranslation(
                                    TrKeys.serviceFee),
                                rightTitle: AppHelpers.numberFormat(
                                    state.orderCalculate?.totalTax ?? 0),
                                textStyle: Style.interRegular(
                                    size: 16, letterSpacing: -0.3),
                              ),
                              16.verticalSpace,
                              TitleAndPrice(
                                title:
                                    AppHelpers.getTranslation(TrKeys.totalTax),
                                rightTitle: AppHelpers.numberFormat(
                                    state.orderCalculate?.totalShopTax ?? 0),
                                textStyle: Style.interRegular(
                                    size: 16, letterSpacing: -0.3),
                              ),
                              16.verticalSpace,
                              const Divider(color: Style.shimmerBase),
                              16.verticalSpace,
                              TitleAndPrice(
                                title: AppHelpers.getTranslation(TrKeys.total),
                                rightTitle: AppHelpers.numberFormat(
                                    state.orderCalculate?.totalPrice ?? 0),
                                textStyle: Style.interSemi(
                                    size: 20, letterSpacing: -0.3),
                              ),
                            ],
                          ),
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: REdgeInsets.all(16),
          child: Row(
            children: [
              const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
              8.horizontalSpace,
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final addressState = ref.watch(orderAddressProvider);
                    final paymentState = ref.watch(orderPaymentProvider);
                    final userState = ref.watch(orderUserProvider);
                    return CustomButton(
                      title: AppHelpers.getTranslation(TrKeys.next),
                      isLoading: ref.watch(createOrderProvider).isCreating,
                      onPressed: () {
                        if (paymentState.payments[paymentState.selectedIndex]
                                .payment?.tag ==
                            'wallet') {
                          final num walletPrice =
                              userState.selectedUser?.wallet?.price ?? 0;
                          final num orderPrice =
                              paymentState.orderCalculate?.totalPrice ?? 0;
                          if (walletPrice < orderPrice) {
                            AppHelpers.showCheckTopSnackBar(
                              context,
                              type: SnackBarType.error,
                              text: AppHelpers.getTranslation(
                                  TrKeys.notEnoughMoney),
                            );
                            return;
                          }
                        }
                        ref.read(createOrderProvider.notifier).createOrder(
                              deliveryType:
                                  ref.watch(deliveryTypeProvider).type,
                              user: userState.selectedUser,
                              stocks: ref.watch(orderCartProvider).stocks,
                              deliveryDate:
                                  ref.watch(deliveryTimeProvider).deliveryDate,
                              address: addressState.textController?.text ?? '',
                              location: addressState.location,
                              entrance: addressState.entrance,
                              floor: addressState.floor,
                              house: addressState.house,
                              orderSuccess: (int orderId) {
                                context.router.popUntilRoot();
                                ref.read(orderCartProvider.notifier).clearAll();
                                ref
                                    .read(orderUserProvider.notifier)
                                    .clearSelectedUserInfo();
                                ref
                                    .read(newOrdersProvider.notifier)
                                    .fetchNewOrders(
                                      context: context,
                                      isRefresh: true,
                                      activeTabIndex:
                                          ref.watch(homeAppbarProvider).index,
                                    );
                                ref
                                    .read(orderPaymentProvider.notifier)
                                    .createTransaction(
                                        context,
                                        orderId,
                                        paymentState
                                            .payments[
                                                paymentState.selectedIndex]
                                            .payment
                                            ?.id);
                              },
                              failed: (message) =>
                                  AppHelpers.showCheckTopSnackBar(
                                context,
                                text: message,
                                type: SnackBarType.error,
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
