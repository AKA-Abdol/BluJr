import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class SettingContainer {
  SettingContainer._privateConstructor();

  static final SettingContainer instance = SettingContainer._privateConstructor();

  late BuildContext drawerContext;
  bool isRootDrawerOpen = false;

  Future<void> onSystemPopHandler(VRedirector vRedirector) async {
    if (SettingContainer.instance.isRootDrawerOpen) {
      Scaffold.of(SettingContainer.instance.drawerContext).closeDrawer();
      return vRedirector.stopRedirection();
    } else if (vRedirector.historyCanBack()) {
      return vRedirector.historyBack();
    }
  }
}
