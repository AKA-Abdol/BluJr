import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/components/price_component.dart';

class ReceiveMoneyContainer extends StatelessWidget {
  const ReceiveMoneyContainer({super.key, required this.type, required this.price, required this.dateTime, required this.description});
  final String type;
  final String price;
  final String dateTime;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(description),
            PriceComponent(price: price),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dateTime),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              decoration: BoxDecoration(
                color: (type == 'A') ? Color(0xFFD9F2E1) : Color(0xffFFF9D2D9),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: (type == 'A') ? Text('واریز') : Text('برداشت'),
            ),
          ],
        ),
        //  leading: Icon(Icons.circle_outlined),
      ),
    );
  }
}
