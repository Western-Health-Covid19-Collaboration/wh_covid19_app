import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/view/disclaimer_view.dart';
import 'package:wh_covid19/view/home_page.dart';

class IntroRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        bool disclaimerFirstView;
        if (snapshot.data != null) {
          disclaimerFirstView =
              snapshot.data.getBool("disclaimer_first_view") ?? false;
        }
        if (disclaimerFirstView == null) {
          return Container();
        } else if (disclaimerFirstView) {
          return HomePage();
        } else {
          return DisclaimerView();
        }
      },
    );
  }
}
