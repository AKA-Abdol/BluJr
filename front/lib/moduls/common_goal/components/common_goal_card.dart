import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/components/price_component.dart';

class CommonGoalCard extends StatelessWidget {
  const CommonGoalCard({
    super.key,
    required this.goalTitle,
    required this.goalPrice,
    required this.startDate,
    required this.onTap,
  });
  final String goalTitle;
  final String goalPrice;
  final String startDate;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              spreadRadius: 4,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  goalTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                PriceComponent(
                  price: goalPrice,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            Row(
              children: [
                const Text('تاریخ شروع :'),
                Text(startDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}
