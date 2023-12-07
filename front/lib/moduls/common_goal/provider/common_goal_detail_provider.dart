import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class CommonGoalDetailProvider extends ChangeNotifier {
  final BuildContext context;

  CommonGoalDetailProvider({required this.context});

  void goToGoalDetailPage() {
    context.vRouter.to('common_goal_detail');
  }
}
