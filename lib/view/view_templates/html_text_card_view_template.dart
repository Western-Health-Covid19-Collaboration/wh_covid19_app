import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:wh_covid19/style.dart';

///Renders html text in a card
class HtmlTextCardViewTemplate extends StatelessWidget {
  final String title;
  final String html;
  final Color bgColor;
  HtmlTextCardViewTemplate({this.title, this.bgColor, this.html});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor ?? AppColors.backgroundBlue,
        appBar: AppBar(
            backgroundColor: AppColors.appBarBackground,
            iconTheme: appBarIconTheme,
            title: Text(title, style: appBarTextStyle)),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Card(
                    child: HtmlWidget(html,
                        textStyle: cardDescriptionTextStyle,
                        bodyPadding: EdgeInsets.all(6))))));
  }
}
