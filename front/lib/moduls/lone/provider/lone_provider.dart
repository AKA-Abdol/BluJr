import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class LoneProvider extends ChangeNotifier {
  final BuildContext context;
  double value = 0;

  LoneProvider({required this.context});

  void onChangeValue(double newValue) {
    value = newValue;
    notifyListeners();
  }

  void goToLoneDetailPage() {
    context.vRouter.to('lone_detail');
  }
}
