import 'package:flutter/material.dart';

class UProductPriceText extends StatelessWidget {
  const UProductPriceText({
    super.key,
    this.currencySign = "\$",
    required this.price,
    this.maxLines = 1,
    this.islarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool islarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      style:
          islarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              )
              : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
