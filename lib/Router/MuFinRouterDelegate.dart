import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MuFinRoutePath.dart';

class MuFinRouterDelegate extends RouterDelegate<MuFinRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MuFinRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

    MuFinRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
      //
    }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [],
    );
  }

  @override
  Future<void> setNewRoutePath(MuFinRoutePath configuration) async {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}