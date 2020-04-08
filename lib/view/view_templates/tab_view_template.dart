import 'package:flutter/material.dart';

import '../../style.dart';

class TabViewTemplate extends StatelessWidget {
  final String title;
  final List<String> tabs;
  final List<Widget> children;
  final List<Widget> actions;

  final Color color;
  final Color indicatorColor;

  const TabViewTemplate(
    this.title, {
    @required this.tabs,
    @required this.children,
    this.color = AppColors.green50,
    this.actions,
    this.indicatorColor,
  });

  List<Widget> getChecklistTitles() {
    return tabs
        .map(
          (item) => Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: Text(item)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: color,
          iconTheme: Styles.appBarIconTheme,
          textTheme: Theme.of(context).textTheme,
          title: Text(
            title,
            style: Styles.textSemiBold,
          ),
          actions: actions,
          bottom: TabBar(
            labelColor: AppColors.blackAlpha800,
            labelStyle: Styles.textSemiBold,
            unselectedLabelColor: AppColors.tabBarDeselectedText,
            indicatorColor: indicatorColor,
            isScrollable: true,
            tabs: getChecklistTitles(),
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
