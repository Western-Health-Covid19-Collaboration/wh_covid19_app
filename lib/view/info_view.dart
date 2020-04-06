import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../hard_data.dart';
import '../routes.dart';
import '../style.dart';
import '../utils/url_utils.dart';
import '../widget/reusable_card.dart';

class InfoView extends StatelessWidget {
  final title = 'Information';
  static const _cardHeight = 34.0;
  static const _cardColor = Colors.white;
  static const _cardElevation = 1.0;

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, Routes.info);
  }

  final topCards = <Widget>[
    ReusableCard(
      title: 'WH Novel Coronavirus information',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whCoronavirusInfoURL),
    ),
    ReusableCard(
      title: 'Contact Numbers',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whURL),
    ),
    const ReusableCard(
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
      fallback: () => UrlUtils.launchWithBrowser(feedbackFormUrl),
    ),
    const ReusableCard(
      title: 'Disclaimer & Conditions of Use',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: Routes.disclaimer,
    ),
    const ReusableCard(
      title: 'Acknowledgements and references',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
    ),
    ReusableCard(
        title: 'Third-Party Licenses',
        color: _cardColor,
        height: _cardHeight,
        elevation: _cardElevation,
        routeTo: Routes.licenses),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: Text(
          title,
          style: Styles.textH5,
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
      const Padding(
        padding: EdgeInsets.all(8.0),
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
