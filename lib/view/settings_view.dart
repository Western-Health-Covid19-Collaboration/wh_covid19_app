import 'package:flutter/material.dart';

import '../strings.dart';
import '../style.dart';

class SettingsView extends StatelessWidget {
  final EdgeInsets _contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 16);

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
        padding: _contentPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
