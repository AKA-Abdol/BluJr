import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class PriceComponent extends StatelessWidget {
  const PriceComponent({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(price.seRagham()),
        const SizedBox(width: 5),
        Text('تومان'),
      ],
    );
  }
}
