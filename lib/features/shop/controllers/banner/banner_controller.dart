import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/banner/banner_repository.dart';
import '../../models/banners_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final _repository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isBannersLoading = false.obs;
  RxBool isLoading = false.obs;

  final carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    await fetchBanners();
    super.onInit();
  }

  /// Update Current Index

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  /// Fetch All Banners
  Future<void> fetchBanners() async {
    try {
      // Start Loading
      isLoading.value = true;

      List<BannerModel> activeBanners = await _repository.fetchActiveBanners();
      // Assign All Banners
      banners.assignAll(activeBanners);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: ' Failded', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
