import 'package:flutter/material.dart';

class CommonGoalDescription extends StatelessWidget {
  const CommonGoalDescription({
    super.key,
    required this.goalTitle,
    required this.description,
  });
  final String goalTitle;
  final String description;

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
            goalTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 5),
          Text(
            'توضیحات این هدف',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(description),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
