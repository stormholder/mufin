import 'package:flutter/material.dart';
import 'package:mufin/ui/assets/assets_page.dart';
import 'package:mufin/ui/home/HomePage.dart';
import 'package:mufin/ui/login/LoginPage.dart';

class Routes {
  Routes._();

  static const String loginRoute = '/mufin/login';
  static const String homeRoute = '/mufin';
  static const String assetsRoute = '/mufin/assets';

  static final routes = <String, WidgetBuilder> {
    loginRoute: (BuildContext context) => LoginPage(),
    homeRoute: (BuildContext context) => HomePage(title: 'MuFin', navigatorKey: GlobalKey<NavigatorState>()),
    assetsRoute: (BuildContext context) => AssetsPage()
  };
}