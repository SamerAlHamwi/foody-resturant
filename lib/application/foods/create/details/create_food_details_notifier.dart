import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/models.dart';

import 'create_food_details_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/services/services.dart';

class CreateFoodDetailsNotifier
    extends StateNotifier<CreateFoodDetailsState> {
  final ProductsRepository _productsRepository;
  final SettingsRepository _settingsRepository;

  CreateFoodDetailsNotifier(
    this._productsRepository,
    this._settingsRepository,
  ) : super(const CreateFoodDetailsState());

  void updateAddFoodInfo() {
    state = state.copyWith(
      images: [],
      listOfUrls: [],
      title: '',
      description: '',
      minQty: '',
      maxQty: '',
      tax: '',
      qrcode: '',
      active: false,
      createdProduct: null,
    );
  }

  void setQrcode(String value) {
    state = state.copyWith(qrcode: value.trim());
  }

  Future<void> createProduct(BuildContext context,{
    int? categoryId,
    int? unitId,
    int? kitchenId,
    VoidCallback? created,
    VoidCallback? onError
  }) async {
    state = state.copyWith(isCreating: true);
    List<String> imageUrl = List.from(state.listOfUrls.map((e) => e.path));
    if (state.images.isNotEmpty) {
      final imageResponse = await _settingsRepository.uploadMultiImage(
        state.images,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl.addAll(data.data?.title ?? []);
        },
        failure: (failure, status) {
          debugPrint('==> upload product image fail: $failure');
          AppHelpers.showCheckTopSnackBar(context, text: failure);
        },
      );
    }
    List<Galleries> tempList = List.from(List.from(state.listOfUrls)
        .where((element) => element.preview != null));
    List<String> previews = [];
    for (var element in tempList) {
      if (element.preview?.isNotEmpty ?? false) {
        previews.add(element.preview!);
      }
    }
    final response = await _productsRepository.createProduct(
      title: state.title,
      description: state.description,
      tax: state.tax,
      minQty: state.minQty,
      maxQty: state.maxQty,
      active: state.active,
      qrcode: state.qrcode,
      interval: state.interval,
      categoryId: categoryId,
      unitId: unitId,
      kitchenId: kitchenId,
      images: imageUrl,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isCreating: false, createdProduct: data.data);
        created?.call();
      },
      failure: (fail,status) {
        debugPrint('===> create product fail $fail');
        state = state.copyWith(isCreating: false);
        AppHelpers.showCheckTopSnackBar(
            context,
            text: fail,
            type: SnackBarType.error
        );
        onError?.call();
      },
    );
  }

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
    debugPrint('===> set active ${state.active}');
  }

  void setMaxQty(String value) {
    state = state.copyWith(maxQty: value.trim());
  }

  void setMinQty(String value) {
    state = state.copyWith(minQty: value.trim());
  }

  void setTax(String value) {
    state = state.copyWith(tax: value.trim());
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.trim());
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
  }

  void setInterval(String value) {
    state = state.copyWith(interval: value.trim());
  }

  void setImageFile(String file) {
    List<String> list = List.from(state.images);
    list.add(file);
    state = state.copyWith(images: list);
  }

  void setUploadImage(Galleries gallery) {
    List<Galleries> list = List.from(state.listOfUrls);
    list.insert(0, gallery);
    state = state.copyWith(listOfUrls: list);
  }

  void deleteImage(String value) {
    List<String> list = List.from(state.images);
    list.remove(value);
    List<Galleries> urls = List.from(state.listOfUrls);
    urls.removeWhere((element) => element.path == value);
    state = state.copyWith(images: list, listOfUrls: urls);
  }
}
