import 'dart:async';

import 'package:mufin/data/sharedpref/shared_preference_helper.dart';

class Repository {
// shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String password) async {
    return await Future.delayed(Duration(seconds: 2), ()=> true);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
}