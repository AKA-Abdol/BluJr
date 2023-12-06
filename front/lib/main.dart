import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/dashboard/page/dashboard.dart';
import 'package:khorsand87/moduls/home/page/home_page.dart';
import 'package:khorsand87/moduls/profile/page/profile_page.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VRouter(
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
              path: 'profile',
              widget: const ProfilePage(),
            ),
          ],
        ),
        /*   VPopHandler(
            onSystemPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
            onPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
            stackedRoutes: [
              VWidget(
                path: 'chat',
                widget: const ChatPage(),
              ),
            ]),
        VPopHandler(
          onSystemPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
          onPop: (vRedirector) async => vRedirector.historyCanBack() ? vRedirector.historyBack() : vRedirector.pop(),
          stackedRoutes: [
            VWidget(
              path: 'bookmark',
              widget: const BookmarkPage(),
            ),
          ],
        ), */
      ],
    ),
  ];
}
