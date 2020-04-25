import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../hard_data.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../widget/notification_banner.dart';
import '../../widget/ppe_card_container.dart';

class PPEOffGuidanceMethod1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.purple50,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.ppeMethod1Title,
          style: Styles.textH5,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_infographic.svg',
            ),
            onPressed: () => Navigator.pushNamed(
                context, Routes.ppeOffGuidanceMethod1Infographic),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NotificationBanner(
            backgroundColor: AppColors.appBackground,
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_warning.svg',
            ),
            message: ppeOffWarning,
          ),
          const PPECardContainer(
            steps: ppeOffMethod1Steps,
            backgroundColor: AppColors.purple50,
          )
        ],
      ),
    );
  }
}
