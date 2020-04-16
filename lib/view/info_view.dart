import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../constants.dart';
import '../hard_data.dart';
import '../routes.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/firebase.dart';
import '../utils/url_utils.dart';
import '../widget/reusable_card.dart';

class InfoView extends StatelessWidget {
  static const _cardHeight = 40.0;
  static const _cardColor = AppColors.purple50;
  static const _cardElevation = 1.0;

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, Routes.info);
  }

  final cards = <Widget>[
    ReusableCard(
      title: Strings.informationWhCoronaTitle,
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whCoronavirusInfoURL),
    ),
    ReusableCard(
      title: Strings.informationWhAnaestheticTitle,
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whAnaestheticMicrositeURL),
    ),
    ReusableCard(
      title: Strings.informationWhIcuTitle,
      color: _cardColor,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whIcuMicrositeURL),
    ),
    _buildSpacer(),
    ReusableCard(
      title: Strings.informationWhContactsTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(whURL),
    ),
    const ReusableCard(
      title: Strings.informationRecommendTitle,
      height: _cardHeight,
      elevation: _cardElevation,
    ),
    _buildSpacer(),
    ReusableCard(
      title: Strings.informationAppFeedbackTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      fallback: () => UrlUtils.launchWithBrowser(feedbackFormUrl),
    ),
    const ReusableCard(
      title: Strings.disclaimerTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: Routes.disclaimer,
    ),
    const ReusableCard(
      title: Strings.informationAppAckRefTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: Routes.acknowledgements,
    ),
    const ReusableCard(
      title: Strings.informationAppThirdPartyTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: Routes.licenses,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsInformationScreen);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.informationTitle,
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
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            'assets/images/icon/high_res_icon.png',
            height: 50,
            width: 50,
          ),
        ),
      ),
      _buildSpacer(height: 8),
      Center(child: _buildVersionTextWidget()),
      _buildSpacer(height: 8),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          Strings.informationFooter,
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
