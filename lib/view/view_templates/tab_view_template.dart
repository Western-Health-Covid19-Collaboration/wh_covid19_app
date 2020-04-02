import 'package:flutter/material.dart';

import '../../style.dart';

class TabViewTemplate extends StatelessWidget {
  final String title;
  final List<String> tabs;
  final List<Widget> children;

  final Color color;
  final Color indicatorColor;

  const TabViewTemplate(this.title,
      {@required this.tabs,
      @required this.children,
      this.color = AppColors.green50,
      this.indicatorColor});

  List<Widget> getChecklistTitles() {
    return tabs
        .map(
          (item) => Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: Text(title)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          iconTheme: AppStyles.appBarIconTheme,
          textTheme: Theme.of(context).textTheme,
          title: Text(
            title,
            style: AppStyles.textSemiBold,
          ),
          bottom: TabBar(
            labelColor: AppColors.blackAlpha800,
            labelStyle: AppStyles.textSemiBold,
            unselectedLabelColor: AppColors.tabBarDeselectedText,
            indicatorColor: indicatorColor,
            isScrollable: true,
            tabs: getChecklistTitles(),
          ),
        ),
        body: TabBarView(children: children),
      ),
    );
  }
}
