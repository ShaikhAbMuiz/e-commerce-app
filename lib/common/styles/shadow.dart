import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/widgets.dart';

class UShadows {
  UShadows._();

  static List<BoxShadow> searchBarShadow = [
     BoxShadow(
              color: UColors.black.withValues(alpha: 0.1),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              // offset: Offset(0, 4),
            ),
  ];
}
