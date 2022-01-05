import 'package:flutter/cupertino.dart';
import 'package:mufin/Router/MuFinRoutePath.dart';

import '../MuFinAppState.dart';

class InnerRouterDelegate extends RouterDelegate<MuFinRoutePath>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<MuFinRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MuFinAppState get appState => _appState;
  MuFinAppState _appState;
  set appState(MuFinAppState value) {
    if (value == _appState) {
      return;
    }
    _appState = value;
    notifyListeners();
  }

  InnerRouterDelegate(this._appState);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(MuFinRoutePath configuration) async {
    assert(false);
  }

}