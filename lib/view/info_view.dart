import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class InfoView extends StatelessWidget {
  final title = 'Information';
  static final _cardHeight = 34.0;
  static final _cardColor = Colors.white;
  static final _cardElevation = 1.0;

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, Routes.info);
  }

  final topCards = <Widget>[
    ReusableCard(
      title: 'Contact Numbers',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
    ),
    ReusableCard(
      title: 'Society & College Recommendations',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
    )
  ];

  final bottomCards = <Widget>[
    ReusableCard(
      title: 'App Feedback',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
    ),
    ReusableCard(
      title: 'Disclaimer & Conditions of Use',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        iconTheme: AppStyles.appBarIconTheme,
        title: Text(
          title,
          style: AppStyles.appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildSpacer(),
            ...topCards,
            _buildSpacer(),
            ..._buildAbout(),
            _buildSpacer(),
            ...bottomCards,
            _buildSpacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacer({double height = 32}) => Container(height: height);

  List<Widget> _buildAbout() {
    return [
      Image.asset(
        'assets/images/icon/high_res_icon.png',
        height: 84,
        width: 84,
      ),
      Center(child: _buildVersionTextWidget()),
      _buildSpacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'About this app. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus gravida quis blandit turpis cursus in hac habitasse platea. In vitae turpis massa sed elementum tempus. Pulvinar neque laoreet suspendisse interdum consectetur libero.'),
      ),
    ];
  }

  Widget _buildVersionTextWidget() {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      initialData: null,
      builder: (context, snapshot) {
        var text = '';
        if (snapshot.hasData) {
          final packageInfo = snapshot.data;
          text = 'v${packageInfo.version} (${packageInfo.buildNumber})';
        }
        return Text(text);
      },
    );
  }
}
