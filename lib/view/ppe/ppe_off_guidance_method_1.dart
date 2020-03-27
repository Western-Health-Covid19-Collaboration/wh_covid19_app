import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../hard_data.dart';
import '../../models/PPEStepInfo.dart';
import '../../style.dart';
import '../../widget/cards/ppe_step_card.dart';
import '../../widget/notification_banner.dart';

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
          ...ppeOffMethod1Steps
              .asMap()
              .entries
              .map((entry) => PPECard(
                    step: PPEStepInfo(
                        image: entry.value.image,
                        notes: entry.value.notes,
                        step: entry.key + 1,
                        text: entry.value.text),
                    backgroundColor: AppColors.purple50,
                  ))
              .toList()
        ]));
  }
}
