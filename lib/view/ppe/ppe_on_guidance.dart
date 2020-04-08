import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../hard_data.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../widget/ppe_card_container.dart';

class PPEOnGuidance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green500,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: Text(
          Strings.ppeStepByStepTitle,
          style: Styles.textH5,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_infographic.svg',
            ),
            onPressed: () =>
                Navigator.pushNamed(context, Routes.ppeOnInfographic),
          )
        ],
      ),
      body: ListView(
        children: const <Widget>[
          PPECardContainer(
            steps: ppeOnSteps,
            backgroundColor: AppColors.green50,
          )
        ],
      ),
    );
  }
}
