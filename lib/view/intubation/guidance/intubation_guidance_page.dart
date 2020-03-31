import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../hard_data.dart';
import '../../../style.dart';
import '../../view_templates/intubation_content_view_template.dart';

class IntubationGuidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: intubationGuide.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green50,
          title: const Text('Intubation Guide'),
          textTheme: Theme.of(context).textTheme,
          iconTheme: AppStyles.appBarIconTheme,
          bottom: TabBar(
            labelColor: AppColors.blackAlpha800,
            labelStyle: AppStyles.textSemiBold,
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
