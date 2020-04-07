import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../hard_data.dart';
import '../routes.dart';
import '../style.dart';
import '../utils/url_utils.dart';
import '../widget/reusable_card.dart';

class InfoView extends StatelessWidget {
  final title = 'Information';
  static const _cardHeight = 40.0;
  static const _cardColor = AppColors.purple50;
  static const _cardElevation = 1.0;

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, Routes.info);
  }

  final cards = <Widget>[
    ReusableCard(
      title: 'WH Novel Coronavirus Website',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whCoronavirusInfoURL),
    ),
    ReusableCard(
      title: 'WH Anaesthetic Microsite',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whAnaestheticMicrositeURL),
    ),
    ReusableCard(
      title: 'WH ICU Microsite',
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whIcuMicrositeURL),
    ),
    _buildSpacer(),
    ReusableCard(
      title: 'Contact Numbers',
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whURL),
    ),
    const ReusableCard(
      title: 'Society & College Recommendations',
      height: _cardHeight,
      elevation: _cardElevation,
    ),
    _buildSpacer(),
    ReusableCard(
      title: 'App Feedback',
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(feedbackFormUrl),
    ),
    const ReusableCard(
      title: 'Disclaimer & Conditions of Use',
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: Routes.disclaimer,
    ),
    const ReusableCard(
      title: 'Acknowledgements and references',
      height: _cardHeight,
      elevation: _cardElevation,
    ),
    const ReusableCard(
        title: 'Third-Party Licenses',
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            _buildSpacer(),
            ...cards,
            _buildSpacer(height: 24),
            ..._buildAbout(),
            _buildSpacer(),
          ],
        ),
      ),
    );
  }

  static Widget _buildSpacer({double height = 16}) => Container(height: height);

  List<Widget> _buildAbout() {
    return [
      Center(
          child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 12, 16, 62),
                  borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/images/icon/high_res_icon.png',
                height: 50,
                width: 50,
              ))),
      _buildSpacer(height: 8),
      Center(child: _buildVersionTextWidget()),
      _buildSpacer(height: 8),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Built with ❤️ by a band of volunteers',
          textAlign: TextAlign.center,
          style: Styles.textFooter,
        ),
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
        return Text(text, style: Styles.textFooter);
      },
    );
  }
}
