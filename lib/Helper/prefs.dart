import 'package:flutter_coins/Helper/sharedHelper.dart';

class Prefs {
  static Future<String>  tutorialString (String key)=> PreferencesHelper.getString(key);

  static Future setTutorialString(String key,String value) => PreferencesHelper.setString(key, value);

  static Future<bool>  authenticated (String key)=> PreferencesHelper.getBool(key);

  static Future setAuthenticated(String key,bool value) => PreferencesHelper.setBool(key, value);

  static Future<String>  passcode (String key)=> PreferencesHelper.getString(key);

  static Future setPasscode(String key,String value) => PreferencesHelper.setString(key, value);

  Future<void> clear() async {
    await Future.wait(<Future>[
      setAuthenticated('',false),
      setTutorialString('',''),
      setPasscode('',''),
    ]);
  }
}