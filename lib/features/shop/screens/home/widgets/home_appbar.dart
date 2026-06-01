import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../../utils/helpers/helper_fuction.dart';
import '../../../../personalization/controller/user_controller.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return UAppBar(
      /// Title and subtitle
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            UHelperFunction.getGreetingMessage(),
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.grey),
          ),

          /// Subtitle
          Obx(() {
            if (controller.profileLoading.value) {
              return UShimmerEffect(width: 80, height: 15);
            }

            return Text(
              controller.user.value.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: UColors.white),
            );
          }),
        ],
      ),

      /// Bag
      actions: [UCartCounterIcon()],

      /// Background Color
    );
  }
}
