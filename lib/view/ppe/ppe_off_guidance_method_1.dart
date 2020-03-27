import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../hard_data.dart';
import '../../style.dart';
import '../../widget/notification_banner.dart';
import '../../widget/ppe_card_container.dart';

class PPEOffGuidanceMethod1 extends StatelessWidget {
  final title = 'Method 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey50,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: AppStyles.appBarIconTheme,
          title: Text(
            title,
            style: AppStyles.textH5,
          ),
        ),
        body: ListView(children: <Widget>[
          NotificationBanner(
            backgroundColor: AppColors.grey50,
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_warning.svg',
            ),
            message: ppeOffWarning,
          ),
          PPECardContainer(
            steps: ppeOffMethod1Steps,
          )
        ]));
  }
}
