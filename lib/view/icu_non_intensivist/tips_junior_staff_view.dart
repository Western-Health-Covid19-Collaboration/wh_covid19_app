import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';

class TipsJuniorStaffView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsCrossSkillingScreen);

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.tipsForCrossSkillingTitle,
          style: Styles.appBarTextStyle,
        ),
      ),
      body: const Center(
        child: Text(
          Strings.toDo,
        ),
      ),
    );
  }
}
