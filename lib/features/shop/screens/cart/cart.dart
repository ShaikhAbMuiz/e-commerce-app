import "package:e_commerce/common/styles/padding.dart";
import "package:e_commerce/common/widgets/appbar/appbar.dart";
import "package:e_commerce/common/widgets/buttons/elevated_button.dart";
import "package:e_commerce/common/widgets/products/cart/cart_items.dart";
import "package:e_commerce/common/widgets/products/cart/product_quantity_with_add_remove.dart";
import "package:e_commerce/common/widgets/texts/product_price_text.dart";
import "package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart";
import "package:e_commerce/features/shop/screens/checkout/checkout.dart";
import "package:e_commerce/utils/constants/colors.dart";
import "package:e_commerce/utils/constants/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! --------[AppBar]--------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineMedium),
      ),

      body: Padding(padding: UPadding.screenPadding, child: UCartItems()),

      //! --------[Bottom Add To Cart]--------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Text("Checkout \$326", style: TextStyle(color: UColors.white)),
        ),
      ),
    );
  }
}
