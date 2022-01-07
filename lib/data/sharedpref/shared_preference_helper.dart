import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.is_logged_in) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.is_logged_in, value);
  }

  // First time:---------------------------------------------------------------------
  Future<bool> get isFirstTime async {
    return _sharedPreference.getBool(Preferences.is_first_launch) ?? false;
  }

  Future<bool> saveIsFirstTime(bool value) async {
    return _sharedPreference.setBool(Preferences.is_first_launch, value);
  }

  // Auth pin:---------------------------------------------------------------------
  Future<String> get authPin async {
    return _sharedPreference.getString(Preferences.auth_pin) ?? "";
  }

  Future<bool> saveAuthPin(String value) async {
    return _sharedPreference.setString(Preferences.auth_pin, value);
  }
}