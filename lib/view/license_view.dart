import 'package:flutter/material.dart';

import '../constants.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/firebase.dart';

class LicenseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics().analyticsScreen(Constants.analyticsLicensesScreen);

    // Using showLicensePage directly gives the wrong style for app bar, and
    // it's not customizable.
    // Pretty tricky to render licenses from scratch, so just draw our own
    // app bar over the top for now.
    return Stack(
      children: [
        const LicensePage(
          applicationLegalese: Strings.licencesMsg,
        ),
        SizedBox(
          height: 80,
          child: Scaffold(
            backgroundColor: AppColors.appBackground,
            appBar: AppBar(
              // Warning brightness interacts with SystemUiOverlayStyle
              // See system_bars.dart comments
              brightness: Brightness.light,
              backgroundColor: AppColors.appBarBackground,
              iconTheme: Styles.appBarIconTheme,
              title: const Text(
                Strings.licencesTitle,
                style: Styles.textH5,
              ),
            ),
            body: Container(),
          ),
        )
      ],
    );
  }
}
