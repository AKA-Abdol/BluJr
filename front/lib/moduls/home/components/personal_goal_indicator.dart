import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PersonalGoalIndicator extends StatelessWidget {
  const PersonalGoalIndicator({super.key});

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
          const SizedBox(height: 10),
          Text('مانده تا هدف شخصی'),
          const SizedBox(height: 15),
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            barRadius: Radius.circular(8),
            lineHeight: 20.0,
            percent: 0.5,
            backgroundColor: Colors.grey,
            //   progressColor: Colors.blue,
            animation: true,
            animationDuration: 1500,
            linearGradient: const LinearGradient(
              colors: [Colors.red, Colors.blue], // Add your gradient colors here
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
