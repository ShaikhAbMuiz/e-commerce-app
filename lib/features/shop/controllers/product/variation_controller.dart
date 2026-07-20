import 'package:e_commerce/features/shop/controllers/product/image_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variable
  RxMap selectedAttributes = {}.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  RxString variationStockStatus = ''.obs;

  /// Methods

  void onAttributeSelected(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    Map<String, dynamic> selectedAttributes = Map<String, dynamic>.from(
      this.selectedAttributes,
    );

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    // Get selected variation
    ProductVariationModel selectedVariation = product.productVariations!
        .firstWhere(
          (variation) => isSameAttributeValue(
            variation.attributeValues,
            selectedAttributes,
          ),
          orElse: () => ProductVariationModel.empty(),
        );
    // Show the selected variation image as main Image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    //Assign Selected Variation to Rx Variation
    this.selectedVariation.value = selectedVariation;

    /// Check Product variation stock status
    getProductVariationStockStatus();
  }

  /// check if selected attributes matches any variation attributes
  bool isSameAttributeValue(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    // if selectedAttributes contain 3 attributes and current variation contain 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attribute is different then return['green' , 'large'] != ['green' , 'small'] then return false
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    final availableAttributesValues =
        variations
            .where(
              (variation) =>
                  variation.attributeValues[attributeName]!.isNotEmpty &&
                  variation.attributeValues[attributeName] != null &&
                  variation.stock > 0,
            )
            .map((variation) => variation.attributeValues[attributeName])
            .toSet();

    return availableAttributesValues;
  }

  /// Get Product Variation Price
  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toStringAsFixed(0);
  }

  /// Check Product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
