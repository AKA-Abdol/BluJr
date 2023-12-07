// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class PriceComponent extends StatelessWidget {
  PriceComponent({
    Key? key,
    required this.price,
    this.style,
  }) : super(key: key);
  final String price;
  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          price.seRagham(),
          style: style,
        ),
        const SizedBox(width: 5),
        Text(
          'تومان',
          style: style,
        ),
      ],
    );
  }
}
