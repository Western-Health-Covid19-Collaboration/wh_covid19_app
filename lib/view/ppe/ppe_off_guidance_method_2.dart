import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../hard_data.dart';
import '../../routes.dart';
import '../../style.dart';
import '../../widget/notification_banner.dart';
import '../../widget/ppe_card_container.dart';

class PPEOffGuidanceMethod2 extends StatelessWidget {
  final title = 'Method 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: Text(
          title,
          style: Styles.textH5,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_infographic.svg',
            ),
            onPressed:
              () => Navigator.pushNamed(context, Routes.ppeOffGuidanceMethod2Infographic),
          )
        ]
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
