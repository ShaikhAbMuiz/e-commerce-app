import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/brand/brand_repository.dart';
import '../../models/brand_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  // Variable
  final _repository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getBrands();
    super.onInit();
  }

  // Fetch All Brands
  Future<void> getBrands() async {
    try {
      // Start Loading
      isLoading.value = true;

      //      Fetch All Brands
      List<BrandModel> allBrands = await _repository.fetchBrands();
      this.allBrands.assignAll(allBrands);

      // Fetch Featured Brands
      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).toList(),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Failed", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
