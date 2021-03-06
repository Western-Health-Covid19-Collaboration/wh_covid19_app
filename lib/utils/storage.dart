import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/disclaimer_model.dart';
import '../strings.dart';

/// Persistent Storage on device read/write
class Settings {
  /// Disclaimer agreement only written as agreed with other data as there is
  /// currently no option for users to not agree to the disclaimer.
  static Future<DisclaimerDetails> readDisclaimerAgreed() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final disclaimerDetails = DisclaimerDetails();

    disclaimerDetails.agreed =
        sharedPrefs.getBool(Constants.settingDisclaimerAgreed) ?? false;
    disclaimerDetails.version =
        sharedPrefs.getString(Constants.settingDisclaimerVersion) ?? '0';
    disclaimerDetails.dateStamp =
        sharedPrefs.getString(Constants.settingDisclaimerAgreedDateTime) ?? '';

    return disclaimerDetails;
  }

  /// Disclaimer agreement only written as agreed with other data as there is
  /// currently no option for users to not agree to the disclaimer.
  static Future<void> writeDisclaimerAgreed() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(Constants.settingDisclaimerAgreed, true);
    await sharedPrefs.setString(
        Constants.settingDisclaimerVersion, Strings.disclaimerCurrentVersion);
    await sharedPrefs.setString(
        Constants.settingDisclaimerAgreedDateTime, DateTime.now().toString());
  }

  /// Privacy setting controls both analytics and crash reporting as one
  /// setting for users, but stored separately on device to allow for
  /// possible future separation.
  static Future<bool> readPrivacy() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    // if not present on device assume that analytics are reported
    final reportAnalytics =
        sharedPrefs.getBool(Constants.settingAnalyticsReporting) ?? true;
    // if not present on device assume that crashes and errors are reported
    final reportCrashes =
        sharedPrefs.getBool(Constants.settingCrashReporting) ?? true;

    return reportAnalytics || reportCrashes;
  }

  /// Privacy setting controls both analytics and crash reporting as one
  /// setting for users, but stored separately on device to allow for
  /// possible future separation.
  static Future<void> writePrivacy(bool newValue) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    // Write the same value for both stored settings
    await sharedPrefs.setBool(Constants.settingAnalyticsReporting, newValue);
    await sharedPrefs.setBool(Constants.settingCrashReporting, newValue);
  }

  /// Read the onboarded value from storage if present
  static Future<bool> readOnboarded() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    // if not present on device assume that onboarded is false
    final hasOnboarded =
        sharedPrefs.getBool(Constants.settingOnboarded) ?? false;

    return hasOnboarded;
  }

  static Future<void> writeOnboarded(bool newValue) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    // When user has completed onboarding write to stored settings
    await sharedPrefs.setBool(Constants.settingOnboarded, newValue);
  }
}
