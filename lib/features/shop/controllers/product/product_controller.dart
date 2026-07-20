import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/texts.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  ///Variables
  final _repository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  onInit() async {
    getFeaturedProducts();
    super.onInit();
  }

  ///Functions to get only 4 featured products
  Future<void> getFeaturedProducts() async {
    try {
      // Start Loadin
      isLoading.value = true;

      // Fetch featured products
      List<ProductModel> featuredProducts =
          await _repository.fetchFeaturedProducts();

      // Assign featured products
      this.featuredProducts.assignAll(featuredProducts);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Failed", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Function to calculate sale percentage
  String? calculateSalePercentage(double? originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice == null || originalPrice <= 0.0) return null;

    double percentage = ((originalPrice! - salePrice) / originalPrice!) * 100;

    return percentage.toStringAsFixed(1);
  }

  ///Get product price or Price range For variable products
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return product.salePrice > 0
          ? product.salePrice.toString()
          : product.price.toString();
    } else {
      for (final variation in product.productVariations!) {
        double variationPrice =
            variation.salePrice > 0 ? variation.salePrice : variation.price;

        if (variationPrice > largestPrice) {
          largestPrice = variationPrice;
        }

        if (variationPrice < smallestPrice) {
          smallestPrice = variationPrice;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toStringAsFixed(0);
      } else {
        return '${largestPrice.toStringAsFixed(0)} - ${UTexts.currency}${smallestPrice.toStringAsFixed(0)}';
      }
    }
  }

  ///Get Product Status
  String getProductStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
