import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brands/brand_products.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/brand/brand_controller.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: UAppBar(
        title: Text("Brand", style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// Text ----[Brands]
              USectionHeading(title: "Brand", showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              /// List of Brands
              Obx(() {
                // [Loading] - State
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                // [Empty] - State
                if (controller.allBrands.isEmpty) {
                  return Center(child: Text("No Brands Found"));
                }
                // [DataFound] - State
                return UGrideLayout(
                  itemCount: controller.allBrands.length,
                  itemBuilder: (context, index) {
                    final brand = controller.allBrands[index];
                    return UBrandCard(
                      brand: brand,
                      onTap: () => Get.to(() => BrandProductsScreen()),
                    );
                  },
                  mainAxisExtent: 80,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
