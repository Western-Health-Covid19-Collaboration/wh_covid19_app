import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../hard_data.dart';
import '../../../routes.dart';
import '../../../style.dart';
import '../../view_templates/intubation_content_view_template.dart';

class IntubationGuidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: intubationGuide.length,
      child: Scaffold(
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: AppColors.green50,
          title: const Text('Intubation Guide'),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icon/SVG/icon_infographic.svg',
              ),
              onPressed: () => Navigator.pushNamed(
                  context, Routes.intubationGuidanceInfographic),
            )
          ],
          textTheme: Theme.of(context).textTheme,
          iconTheme: Styles.appBarIconTheme,
          bottom: TabBar(
            labelColor: AppColors.blackAlpha800,
            labelStyle: Styles.textSemiBold,
            unselectedLabelColor: AppColors.tabBarDeselectedText,
            indicatorColor: AppColors.green900,
            tabs: intubationGuide.map((e) => Tab(text: e.name)).toList(),
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: intubationGuide
              .map((e) => IntubationContentViewTemplate(content: e))
              .toList(),
        ),
      ),
    );
  }
}
