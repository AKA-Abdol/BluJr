import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/common_goal/page/commmon_goal_detail_page.dart';
import 'package:khorsand87/moduls/common_goal/page/common_goal_page.dart';
import 'package:khorsand87/moduls/core/dashboard/page/dashboard.dart';
import 'package:khorsand87/moduls/home/page/home_page.dart';
import 'package:khorsand87/moduls/lone/page/lone_detail_page.dart';
import 'package:khorsand87/moduls/lone/page/lone_page.dart';
import 'package:khorsand87/them/app_them.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VRouter(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}

List<VRouteElement> get routes {
  return [
    VNester(
      path: '/',
      widgetBuilder: (child) => DashboardPage(
        child: child,
      ),
      nestedRoutes: [
        VWidget(
          path: null,
          widget: const HomePage(),
        ),
        VPopHandler(
          onSystemPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
          onPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
          stackedRoutes: [
            VWidget(
              path: 'lone',
              widget: const LonePage(),
              stackedRoutes: [
                VPopHandler(
                  onSystemPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
                  onPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
                  stackedRoutes: [
                    VWidget(
                      path: 'lone_detail',
                      widget: const LoneDetailPage(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        VWidget(
          path: 'common_goal',
          widget: const CommonGoalPage(),
          stackedRoutes: [
            VPopHandler(
              onSystemPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
              onPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
              stackedRoutes: [
                VWidget(
                  path: 'common_goal_detail',
                  widget: const CommonGoalDetailPage(),
                ),
              ],
            )
          ],
        ),
        /*   VPopHandler(
          onSystemPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
          onPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
          stackedRoutes: [
            VWidget(
              path: 'bookmark',
              widget: const BookmarkPage(),
            ),
          ],
        ),  */
      ],
    ),
  ];
}
