import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../hard_data.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';
import '../../widget/notification_banner.dart';
import '../../widget/ppe_card_container.dart';

class PPEOffGuidanceMethod2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsPPEOffMethod2Screen);

    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.ppeMethod2Title,
          style: Styles.textH5,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_infographic.svg',
            ),
            onPressed: () => Navigator.pushNamed(
                context, Routes.ppeOffGuidanceMethod2Infographic),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NotificationBanner(
            backgroundColor: AppColors.grey50,
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_warning.svg',
            ),
            message: ppeOffWarning,
          ),
          const PPECardContainer(
            steps: ppeOffMethod2Steps,
            backgroundColor: AppColors.purple50,
          )
        ],
      ),
    );
  }
}
