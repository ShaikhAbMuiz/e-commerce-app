import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! --------[AppBar]--------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Add New Address",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      //! --------[Body]--------
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // ? Name
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  label: Text("Name"),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields),

              // ? Phone Number
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  label: Text("Phone Number"),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields),

              // ? Street & Postal Code
              Row(
                children: [
                  // ? Street
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        label: Text("Street"),
                      ),
                    ),
                  ),
                  SizedBox(width: USizes.spaceBtwInputFields),
                  // ? Postal Code
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.location),
                        label: Text("Postal Code"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwInputFields),

              // ? State & City
              Row(
                children: [
                  // ? City
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        label: Text("City"),
                      ),
                    ),
                  ),
                  SizedBox(width: USizes.spaceBtwInputFields),
                  // ? State
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        label: Text("State"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwInputFields),

              // ? Country
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  label: Text("Country"),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields),

              // ? Save Button
              UElevatedButton(onPressed: () {}, child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
