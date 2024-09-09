import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../infrastructure/services/services.dart';
import 'add_food_categories_state.dart';
import '../../../../../domain/interface/interfaces.dart';
import '../../../../../infrastructure/models/models.dart';

class AddFoodCategoriesNotifier extends StateNotifier<AddFoodCategoriesState> {
  final CatalogRepository _catalogRepository;
  int _page = 0;

  AddFoodCategoriesNotifier(this._catalogRepository)
      : super(
          AddFoodCategoriesState(categoryController: TextEditingController()),
        );

  Future<void> updateCategories(BuildContext context,
      {RefreshController? controller}) async {
    if (controller == null) {
      _page = 0;
    }

    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        List<CategoryData> categories = List.from(state.categories);
        final List<CategoryData> newCategories = data.data ?? [];
        for (final category in newCategories) {
          bool contains = false;
          for (final oldCategory in categories) {
            if (category.id == oldCategory.id) {
              contains = true;
            }
          }
          if (!contains) {
            categories.insert(0, category);
          }
        }
        state = state.copyWith(categories: categories, activeIndex: 0);
        if (categories.isNotEmpty) {
          state.categoryController?.text =
              state.categories[0].translation?.title ?? '';
        }

        controller?.loadComplete();

        if (data.data?.isEmpty ?? true) {
          controller?.loadNoData();
        }
      },
      failure: (failure, status) {
        debugPrint('====> fetch categories fail $failure');
        _page--;
        AppHelpers.showCheckTopSnackBar(context,
            text: failure, type: SnackBarType.error);
      },
    );
  }

  Future<void> updateCategoriesSub(BuildContext context,
      {RefreshController? controller}) async {
    if (controller == null) {
      _page = 0;
    }

    final response = await _catalogRepository.getCategoriesSub(page: ++_page);
    response.when(
      success: (data) {
        List<CategoryData> categories = List.from(state.categoriesSub);
        final List<CategoryData> newCategories = data.data ?? [];
        for (final category in newCategories) {
          bool contains = false;
          for (final oldCategory in categories) {
            if (category.id == oldCategory.id) {
              contains = true;
            }
          }
          if (!contains) {
            categories.insert(0, category);
          }
        }
        state = state.copyWith(categoriesSub: categories, activeIndex: 0);
        if (categories.isNotEmpty) {
          state.categorySubController?.text =
              state.categoriesSub[0].translation?.title ?? '';
        }

        controller?.loadComplete();

        if (data.data?.isEmpty ?? true) {
          controller?.loadNoData();
        }
      },
      failure: (failure, status) {
        debugPrint('====> fetch categories fail $failure');
        _page--;
        AppHelpers.showCheckTopSnackBar(context,
            text: failure, type: SnackBarType.error);
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
    state.categoryController?.text =
        state.categories[index].translation?.title ?? '';
  }

  void setActiveIndexSub(int index) {
    if (state.activeSubIndex == index) {
      return;
    }

    state = state.copyWith(
        activeSubIndex: index,
        categorySubController: TextEditingController(
            text: state.categoriesSub[index].translation?.title ?? ''));
  }

  void setCategories(List<CategoryData> categories) {
    if (state.categories.isEmpty) {
      _page = 0;
      state = state.copyWith(categories: categories, activeIndex: 0);
      if (categories.isNotEmpty) {
        state.categoryController?.text =
            state.categories[0].translation?.title ?? '';
      }
    }
  }

  Future<void> deleteCategories(CategoryData category) async {
    final res = await _catalogRepository.deleteCategory(id: category.id);
    res.when(
        success: (success) {
          final List<CategoryData> list = List.from(state.categories);
          list.remove(category);
          state = state.copyWith(categories: list, activeIndex: 0);
        },
        failure: (failure, s) {
          debugPrint("delete categories fail: $failure");
        });
  }

  void setCategoriesSub(List<CategoryData> categories) {
    if (state.categoriesSub.isEmpty) {
      _page = 0;
      state = state.copyWith(categoriesSub: categories, activeSubIndex: 0);
      if (categories.isNotEmpty) {
        state.categorySubController?.text =
            state.categoriesSub[0].translation?.title ?? '';
      }
    }
  }
}
