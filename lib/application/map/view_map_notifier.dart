import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/models/data/address_data.dart';
import '../../infrastructure/services/services.dart';
import '../../presentation/pages/add_address.dart';
import 'view_map_state.dart';

class ViewMapNotifier extends StateNotifier<ViewMapState> {

  ViewMapNotifier() : super(const ViewMapState());

  void changePlace(AddressData place) {
    state = state.copyWith(place: place, isSetAddress: true);
  }

  void checkAddress(BuildContext context) {
    AddressData? data = LocalStorage.getAddressSelected();
    if (data == null) {
      state = state.copyWith(isSetAddress: false);
      AppHelpers.showAlertDialog(context: context, child: const AddAddress());
    } else {
      state = state.copyWith(isSetAddress: true);
    }
  }

  updateActive() {
    state = state.copyWith(isLoading: true);
  }

}
