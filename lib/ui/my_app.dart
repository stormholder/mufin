import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mufin/data/sharedpref/constants/preferences.dart';
import 'package:mufin/ui/home/HomePage.dart';
import 'package:mufin/ui/login/LoginPage.dart';
import 'package:mufin/Router/Routes.dart';
import 'package:mufin/data/repository.dart';
import 'package:mufin/di/components/service_locator.dart';
import 'package:mufin/stores/user/user_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles.dart';

class MyApp extends StatefulWidget {

  // @override
  // Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [],
    //   child: Observer(
    //     name: 'global-observer',
    //     builder: (context) {
    //       return MaterialApp(
    //         restorationScopeId: 'mufin_app',
    //         title: 'MuFin',
    //         debugShowCheckedModeBanner: false,
    //         theme: ThemeData.from(colorScheme: MuFinTheme.light),
    //         darkTheme: ThemeData.from(colorScheme: MuFinTheme.dark),
    //         routes: Routes.routes,
    //         home: _userStore.isLoggedIn
    //             ? HomePage(title: 'MuFin', navigatorKey: GlobalKey<NavigatorState>())
    //             : LoginPage(),
    //       );
    //     },
    //   ),
    // );
  // }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final UserStore _userStore = UserStore(getIt<Repository>());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused:
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool(Preferences.is_logged_in, false);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'mufin_app',
      title: 'MuFin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: MuFinTheme.light),
      darkTheme: ThemeData.from(colorScheme: MuFinTheme.dark),
      routes: Routes.routes,
      home: _userStore.isLoggedIn
          ? HomePage(title: 'MuFin', navigatorKey: GlobalKey<NavigatorState>())
          : LoginPage(),
    );
  }

}