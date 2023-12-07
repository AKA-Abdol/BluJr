import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/app_bottom_nav_bar.dart';
import 'package:khorsand87/moduls/core/components/app_drawer.dart';

import 'package:khorsand87/moduls/core/dashboard/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(context: context),
      child: _DashboardPage(child: child),
    );
  }
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: VWidgetGuard(
        child: child,
      ),
      bottomNavigationBar: const AppBottomNavbar(),
    );
  }
}
