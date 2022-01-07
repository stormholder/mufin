import 'package:flutter/material.dart';
import 'package:mufin/ui/home/HomePage.dart';
import 'package:mufin/ui/login/LoginPage.dart';

class Routes {
  Routes._();

  static const String loginRoute = '/mufin/login';
  static const String homeRoute = '/mufin';

  static final routes = <String, WidgetBuilder> {
    loginRoute: (BuildContext context) => LoginPage(),
    homeRoute: (BuildContext context) => HomePage(title: 'MuFin', navigatorKey: GlobalKey<NavigatorState>())
  };
}