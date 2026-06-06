import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/category/category_repository.dart';
import '../../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// Variables
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  RxBool isCategoriesLoading = false.obs;

  final _repository = Get.put(CategoryRepository());

  @override
  void onInit() async {
    await fetchCategories();
    super.onInit();
  }

  /// Fuction to Fetch All Categories & featured Categories from Firebase
  Future<void> fetchCategories() async {
    try {
      // Start Loading
      isCategoriesLoading.value = true;

      // Fetch Categories
      List<CategoryModel> categories = await _repository.getAllCategories();
      // Assign Categories to List Variables
      allCategories.assignAll(categories);

      // Fetch Featured Categories
      featuredCategories.assignAll(
        categories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .toList(),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Failed", message: e.toString());
    } finally {
      isCategoriesLoading.value = false;
    }
  }
}
