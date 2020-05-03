import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../strings.dart';

/// Persistent Storage on device read/write
/// Read Settings values at app startup and set app state for these values
/// (app state continue to use Provider package), These app state values are
/// used multiple places through the code for each setting. This is approach
/// is preferred rather than read the value from persistent storage at multiple
/// places throughout the code. This minimises the reads/writes from/to
/// persistent storage as devices have slow storage speeds.

class Settings {
  static Future<bool> readDisclaimerAgreed() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(Constants.settingDisclaimerAgreed) ?? false;
  }

  static Future<String> readDisclaimerVersion() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(Constants.settingDisclaimerVersion) ?? '0';
  }

  static Future<String> readDisclaimerAgreedDateTime() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(Constants.settingDisclaimerAgreedDateTime) ??
        '';
  }

  static Future<void> writeDisclaimerAgreed() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(Constants.settingDisclaimerAgreed, true);
    await sharedPrefs.setString(
        Constants.settingDisclaimerVersion, Strings.disclaimerCurrentVersion);
    await sharedPrefs.setString(
        Constants.settingDisclaimerAgreedDateTime, DateTime.now().toString());
  }
}
