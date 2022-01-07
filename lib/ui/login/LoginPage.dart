import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mufin/Router/Routes.dart';
import 'package:mufin/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isFingerprint = false;

  var myPass = [1,2,3,4];

  Future<Null> biometrics() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LockScreen(
        title: "This is Screet ",
        passLength: myPass.length,
        bgImage: "images/bg.jpg",
        fingerPrintImage: Image.asset(
          "images/fingerprint.png",
          height: 40,
          width: 40,
          color: Colors.white,
        ),
        showFingerPass: true,
        fingerFunction: biometrics,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }

          return true;
        },
        onSuccess: () {
          SharedPreferences.getInstance().then((prefs) {
            prefs.setBool(Preferences.is_logged_in, true);
          });

          Future.delayed(Duration(milliseconds: 0), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.homeRoute, (Route<dynamic> route) => false);
          });
        });
  }
}