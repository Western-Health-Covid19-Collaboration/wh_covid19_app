import 'package:flutter/material.dart';

import '../strings.dart';
import '../style.dart';
import '../widget/switch_card.dart';

class SettingsView extends StatelessWidget {
  final EdgeInsets _contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 16);

  static const _cardHeight = 40.0;
  static const _cardElevation = 1.0;
  static const _space = 16.0;

  final cards = <Widget>[
    SwitchCard(),
  ];

  static Widget _buildSpacer({double height = _space}) =>
      Container(height: height);

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
        title: const Text(
          Strings.settingsTitle,
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
