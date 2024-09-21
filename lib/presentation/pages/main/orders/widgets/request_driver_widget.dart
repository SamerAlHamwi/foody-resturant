


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../styles/style.dart';
import '../../../../component/components.dart';
import '../../../../../infrastructure/services/services.dart';
import '../../widgets/custom_dropdown.dart';


class RequestDriverModal extends ConsumerStatefulWidget {
  const RequestDriverModal({super.key}) ;

  @override
  ConsumerState<RequestDriverModal> createState() => _RequestDriverModalState();
}

class _RequestDriverModalState extends ConsumerState<RequestDriverModal> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double extraDeliveryPrice = 0.0;
  List<DropDownValue> list = [
    const DropDownValue(id: 0, name: 'Amman - 2.0 JOD'),
    const DropDownValue(id: 1, name: 'Irbid - 1.5 JOD'),
    const DropDownValue(id: 2, name: 'Zarqa - 1.2 JOD'),
    const DropDownValue(id: 3, name: 'Balqa - 3.5 JOD'),
    const DropDownValue(id: 4, name: 'Madaba - 6.0 JOD'),
    const DropDownValue(id: 5, name: 'Mafraq - 2.4 JOD'),
    const DropDownValue(id: 6, name: 'Jerash - 3.4 JOD'),
    const DropDownValue(id: 7, name: 'Ajloun - 1.7 JOD'),
    const DropDownValue(id: 8, name: 'Karak - 4.4 JOD'),
    const DropDownValue(id: 9, name: 'Tafilah - 5.5 JOD'),
    const DropDownValue(id: 10, name: 'Ma\'an - 1.1 JOD'),
    const DropDownValue(id: 11, name: 'Aqaba - 3.1 JOD'),
  ];



  String value = "Amman - 2.0 JOD";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Column(
        children: [
          const ModalDrag(),
          Container(
            padding: REdgeInsets.all(6),
            height: 48.h,
            decoration: BoxDecoration(
              color: Style.transparent,
              borderRadius: BorderRadius.circular(10.r),
              // border: Border.all(color: Style.tabBarBorderColor),
            ),
            margin: REdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              onTap: (index) {},
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Style.blackColor,
              ),
              labelColor: Style.white,
              unselectedLabelColor: Style.textColor,
              unselectedLabelStyle: Style.interRegular(size: 14.sp),
              labelStyle: Style.interSemi(size: 14.sp),
              tabs: [
                Tab(
                  child: Text(AppHelpers.getTranslation(TrKeys.getDriver)),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.deliveryImage,
                  width: 100.w,
                  height: 100.h,
                ),
                15.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.deliveryZone),
                      style: Style.interNormal(
                        size: 15.sp,
                      ),
                    ),
                    6.verticalSpace,
                    CustomDropdown(
                      initialValue: const DropDownValue(id: 0, name: 'Amman - 2.0 JOD',),
                      searchable: true,
                      list: list,
                      onChanged: (value) {

                      },
                      // hintText: S.of(context).brand,
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.extraDeliveryPrice),
                          style: Style.interNormal(
                            size: 15.sp,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                if(extraDeliveryPrice > 0){
                                  setState(() {
                                    extraDeliveryPrice -= 0.1;
                                    extraDeliveryPrice = double.parse(extraDeliveryPrice.toStringAsFixed(1));
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Style.black,
                              ),
                            ),
                            Text(
                              extraDeliveryPrice.toString(),
                              style: Style.interNormal(
                                size: 16.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  extraDeliveryPrice += 0.1;
                                  extraDeliveryPrice = double.parse(extraDeliveryPrice.toStringAsFixed(1));
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    8.verticalSpace,
                  ],
                ),
                20.verticalSpace,
                CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.submit),
                  // isLoading: state.isCreating,
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




