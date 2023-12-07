import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/components/price_component.dart';

class RefundDescriptionContainer extends StatelessWidget {
  const RefundDescriptionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('مبلغ بازپرداخت'),
                PriceComponent(price: '1256000'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('مبلغ بازپرداخت هفتگی'),
                PriceComponent(price: '62500'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
