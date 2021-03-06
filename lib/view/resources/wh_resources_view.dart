import 'package:flutter/material.dart';

import '../../hard_data.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../widget/reusable_card.dart';

class WHResourcesView extends StatelessWidget {
  static const _cardHeight = 40.0;
  static const _cardElevation = 1.0;
  static const _space = 16.0;

  final cards = <Widget>[
    const ReusableCard(
      title: Strings.informationWhCoronaTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: whCoronavirusInfoURL,
    ),
    const ReusableCard(
      title: Strings.informationWhAnaestheticTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: whAnaestheticMicrositeURL,
    ),
    const ReusableCard(
      title: Strings.informationWhIcuTitle,
      height: _cardHeight,
      elevation: _cardElevation,
      routeTo: whIcuMicrositeURL,
    ),
  ];

  static Widget _buildSpacer({double height = _space}) =>
      Container(height: height);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPurple,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.purple50,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.whResourcesTitle,
          style: Styles.textH5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _space),
        child: ListView(
          children: <Widget>[
            _buildSpacer(),
            ...cards,
            _buildSpacer(),
          ],
        ),
      ),
    );
  }
}
