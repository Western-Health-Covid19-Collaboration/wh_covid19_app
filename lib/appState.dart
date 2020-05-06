import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/disclaimer_model.dart';
import 'strings.dart';
import 'utils/storage.dart';

/// Notifications Notifier - controls changes of notifications setting
class PrivacyStateNotifier with ChangeNotifier {
  final Settings _settings;
  bool _privacy;

  PrivacyStateNotifier(this._settings) {
    _settings.readPrivacy().then((privacySetting) {
      _privacy = privacySetting;
      notifyListeners();
    });
  }

  // Changes the privacy setting in app state and updates the listeners
  void privacyChange(bool privacy) {
    // Update persistent storage with the new value
    _settings.writePrivacy(privacy);
    _privacy = privacy;
    notifyListeners();
  }

  void writeDisclaimerAgreed() => _settings.writeDisclaimerAgreed();

  // Returns the current Notifications Setting state
  bool get currentPrivacy => _privacy;

  Future<bool> get disclaimerAgreed async {
    final disclaimer = await _settings.readDisclaimerAgreed();
    return disclaimer.agreed == true &&
        disclaimer.version == Strings.disclaimerCurrentVersion;
  }

  Future<DisclaimerDetails> get disclaimerDetails =>
      _settings.readDisclaimerAgreed();
}
