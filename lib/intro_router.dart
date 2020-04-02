import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes.dart';
import 'strings.dart';

class IntroRouter extends StatefulWidget {
  @override
  _IntroRouterState createState() => _IntroRouterState();
}

class _IntroRouterState extends State<IntroRouter> {
  @override
  void initState() {
    super.initState();
    _checkDisclaimerFirstView();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // Check any persisted values for the disclaimer if present
  Future<void> _checkDisclaimerFirstView() async {
    final prefs = await SharedPreferences.getInstance();
    final disclaimerAgreed = prefs.getBool(Strings.settingDisclaimerAgreed) ?? false;
    final disclaimerVersion = prefs.getString(Strings.settingDisclaimerVersion) ?? '0';

    // Disclaimer should be shown (not the Home screen) if the user has not previously agreed to the disclaimer, or
    // the version of the disclaimer the user agreed to is not the latest version of the disclaimer.
    // Users should not be able to access the app if they have not agreed to the latest version of the disclaimer,
    // which may be updated over time.
    if (disclaimerAgreed == true && disclaimerVersion == Strings.disclaimerVersion) {
      await Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      await Navigator.of(context).pushReplacementNamed(Routes.disclaimer);
    }
  }
}
