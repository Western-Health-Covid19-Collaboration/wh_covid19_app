import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../hard_data.dart';
import '../../style.dart';
import '../../widget/cards/ppe_step_card.dart';
import '../../widget/notification_banner.dart';

class PPEOffGuidance1 extends StatelessWidget {
  final title = 'Method 2';

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
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_warning.svg',
            ),
            message: ppeOffWarning,
          ),
          ...ppeOffMethod1Steps
              .asMap()
              .entries
              .map((entry) => PPECard(
                    index: entry.key + 1,
                    step: entry.value,
                    backgroundColor: AppColors.purple50,
                  ))
              .toList()
        ]));
  }
}
