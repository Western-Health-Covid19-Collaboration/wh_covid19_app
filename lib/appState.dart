import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'utils/storage.dart';

/// Notifications Notifier - controls changes of notifications setting
class PrivacyStateNotifier with ChangeNotifier {
  final bool storedPrivacyState;
  static bool currentPrivacyState;

  // Constructor to use the passed stored value as the initial app state
  PrivacyStateNotifier(this.storedPrivacyState) {
    if (storedPrivacyState != null) {
      currentPrivacyState = storedPrivacyState;
    }
  }

  // Changes the privacy setting in app state and updates the listeners
  void privacyChange(bool newValue) {
    currentPrivacyState = newValue;
    // Update persistent storage with the new value
    Settings.writePrivacy(newValue);
    notifyListeners();
  }

  // Returns the current Notifications Setting state
  bool get currentPrivacy => currentPrivacyState;
}
