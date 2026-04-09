import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Abdul Muiz',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        'abdulmuiz9922@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(onPressed: () {}, icon: Icon(Iconsax.edit)),
    );
  }
}
