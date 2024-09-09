import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderfoodyman/domain/interface/interfaces.dart';
import 'package:venderfoodyman/infrastructure/models/data/user_data.dart';

import '../../infrastructure/models/data/address_data.dart';
import '../../infrastructure/services/services.dart';
import 'package:venderfoodyman/presentation/routes/app_router.dart';
import 'profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final SettingsRepository _settingsRepository;
  final UsersRepository _usersRepository;
  final ShopsRepository _shopsRepository;

  ProfileNotifier(
      this._settingsRepository, this._usersRepository, this._shopsRepository)
      : super(const ProfileState());
  int page = 1;

  resetShopData() {
    state = state.copyWith(
        bgImage: "", logoImage: "", addressModel: null, isSaveLoading: false);
  }

  setBgImage(String bgImage) {
    state = state.copyWith(bgImage: bgImage);
  }

  setLogoImage(String logoImage) {
    state = state.copyWith(logoImage: logoImage);
  }

  setAddress(AddressData? data) {
    state = state.copyWith(addressModel: data);
  }

  setPhone(String? data) {
    state = state.copyWith(userData: UserData(phone: data));
  }

  Future<void> fetchUser(BuildContext context,
      {RefreshController? refreshController,ValueChanged<String?>? onSuccess}) async {
    if (LocalStorage.getToken().isNotEmpty) {
      final connected = await AppConnectivity.connectivity();
      if (connected) {
        if (refreshController == null) {
          state = state.copyWith(isLoading: true);
        }
        final response = await _usersRepository.getProfileDetails();
        response.when(
          success: (data) async {
            LocalStorage.setProfileImage(data.data?.img);
            LocalStorage.setUserId(data.data?.id);
            LocalStorage.setWalletData(data.data?.wallet);
            LocalStorage.setFirstName(data.data?.firstname);
            LocalStorage.setLastName(data.data?.lastname);
            onSuccess?.call(data.data?.phone);
            if (refreshController == null) {
              state = state.copyWith(isLoading: false, userData: data.data);
            } else {
              state = state.copyWith(userData: data.data);
            }
            refreshController?.refreshCompleted();
          },
          failure: (failure, status) {
            if (refreshController == null) {
              state = state.copyWith(isLoading: false);
            }
            if (status == 401) {
              context.router.popUntilRoot();
              context.replaceRoute(const LoginRoute());
            }
            AppHelpers.showCheckTopSnackBar(
              context,
              text: failure,
            );
          },
        );
      } else {
        if (context.mounted) {
          AppHelpers.showNoConnectionSnackBar(context);
        }
      }
    }
  }

  changeIndex(int index) {
    state = state.copyWith(typeIndex: index);
  }

  Future<void> createShop({
    required BuildContext context,
    required String tax,
    required String deliveryTo,
    required String deliveryFrom,
    required String phone,
    required String startPrice,
    required String name,
    required String desc,
    required String perKm,
    required AddressData address,
    required String deliveryType,
    required num categoryId,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSaveLoading: true);
      String? logoImage;
      String? backgroundImage;
      if (state.logoImage.isNotEmpty) {
        final logoResponse = await _settingsRepository.uploadImage(
          state.logoImage,
          UploadType.shopsLogo,
        );
        logoResponse.when(
          success: (data) {
            logoImage = data.imageData?.title;
          },
          failure: (failure, s) {
            debugPrint('===> upload logo image failure: $failure');
            AppHelpers.showCheckTopSnackBar(
              context,
              text: failure,
            );
          },
        );
      }
      if (state.bgImage.isNotEmpty) {
        final backgroundResponse = await _settingsRepository.uploadImage(
          state.bgImage,
          UploadType.shopsBack,
        );
        backgroundResponse.when(
          success: (data) {
            backgroundImage = data.imageData?.title;
          },
          failure: (failure, s) {
            debugPrint('===> upload background image failure: $failure');
            AppHelpers.showCheckTopSnackBar(
              context,
              text: failure,
            );
          },
        );
      }
      final response = await _shopsRepository.createShop(
        logoImage: logoImage,
        backgroundImage: backgroundImage,
        tax: double.tryParse(tax) ?? 0,
        deliveryTo: double.tryParse(deliveryTo) ?? 0,
        deliveryFrom: double.tryParse(deliveryFrom) ?? 0,
        deliveryType: deliveryType,
        phone: phone,
        name: name,
        description: desc,
        startPrice: double.tryParse(startPrice) ?? 0,
        perKm: double.tryParse(perKm) ?? 0,
        address: address,
        category: categoryId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isSaveLoading: false);
          fetchUser(context, refreshController: RefreshController());
          context.popRoute();
        },
        failure: (failure, s) {
          state = state.copyWith(isSaveLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            text: failure,
          );
          debugPrint('==> create shop failure: $failure');
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showCheckTopSnackBar(
          context,
          text: AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _usersRepository.deleteAccount();
      response.when(
        success: (data) async {
          LocalStorage.logout();
          context.router.popUntilRoot();
          context.replaceRoute(const LoginRoute());
        },
        failure: (fail, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            text:fail,
          );
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
