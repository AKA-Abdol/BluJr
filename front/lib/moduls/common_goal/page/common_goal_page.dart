import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/common_goal/provider/common_goal_detail_provider.dart';
import 'package:provider/provider.dart';

class CommonGoalPage extends StatelessWidget {
  const CommonGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommonGoalDetailProvider(context: context),
      child: const _CommonGoalPage(),
    );
  }
}

class _CommonGoalPage extends StatelessWidget {
  const _CommonGoalPage();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
