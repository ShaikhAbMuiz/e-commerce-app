import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/screen/success_screen.dart';
import 'package:e_commerce/common/widgets/textfields/promo_code.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart' show UColors;
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      //! --------[AppBar]--------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      //! --------[Body]--------
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // Items
              UCartItems(showAddRemoveButton: false),
              SizedBox(height: USizes.spaceBtwSections),

              // Promo Code
              UPromoCodeField(),
              SizedBox(height: USizes.spaceBtwSections),

              // Billing Section
              URoundedContainer(
                showBoader: true,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(USizes.md),
                child: Column(
                  children: [
                    // Amount  Section
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    Divider(thickness: 1.0),

                    /// Payment
                    UBillingPaymentSection(),

                    // Address
                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //! --------[Bottom Add To Cart]--------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  title: "Payment Success!",
                  image: UImages.successPayment,
                  subTitle: 'Your item will be shipped soon',
                  onTap: () => Get.offAll(() => const NavigationMenu()),
                ),
              ),
          child: Text("Checkout \$326", style: TextStyle(color: UColors.white)),
        ),
      ),
    );
  }
}
