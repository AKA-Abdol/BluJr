import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/common_goal/components/pieChartState.dart';
import 'package:khorsand87/moduls/common_goal/provider/common_goal_detail_provider.dart';
import 'package:provider/provider.dart';

class CommonGoalDetailPage extends StatelessWidget {
  const CommonGoalDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommonGoalDetailProvider(context: context),
      child: const _CommonGoalDetailPage(),
    );
  }
}

class _CommonGoalDetailPage extends StatelessWidget {
  const _CommonGoalDetailPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('جزییات هدف'),
          ),
          body: const PieChartSample2(),
        ),
      ),
    );
  }
}
