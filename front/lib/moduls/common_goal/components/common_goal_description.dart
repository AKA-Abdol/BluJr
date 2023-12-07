import 'package:flutter/material.dart';

class CommonGoalDescription extends StatelessWidget {
  const CommonGoalDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
          Text(
            'عنوان هدف',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            ' خرید کنسول بازی  ps5',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'توضیحات این هدف',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
