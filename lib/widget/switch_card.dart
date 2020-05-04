import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appState.dart';
import '../hard_data.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/storage.dart';

class SwitchCard extends StatefulWidget {
  @override
  _SwitchCardState createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  static bool _selected;

  @override
  void initState() {
    _selected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(4.0),
          color: Colors.white,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 80,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    Strings.settingsPrivacyTitle,
                    style: Styles.textP,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CupertinoSwitch(
                    activeColor: AppColors.backgroundGreen,
                    value: Provider.of<PrivacyStateNotifier>(context)
                        .currentPrivacy,
                    onChanged: (bool newValue) {
                      // On switch value changing, update app state and write
                      // to device storage
                      setState(() {
                        // Update app state with new value
                        Provider.of<PrivacyStateNotifier>(context,
                                listen: false)
                            .privacyChange(newValue);
                        // Update persistent storage with the new value
                        Settings.writePrivacy(newValue);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'The app gathers general usage information using ',
                  style: Styles.subText,
                ),
                TextSpan(
                  text: 'Google Analytics',
                  style: Styles.subtextHyperlink,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(googleAnalyticsURL);
                    },
                ),
                const TextSpan(
                  text: ' alongside crash and error reporting via ',
                  style: Styles.subText,
                ),
                TextSpan(
                  text: 'Sentry',
                  style: Styles.subtextHyperlink,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(sentryURL);
                    },
                ),
                const TextSpan(
                  text: ' to help improve the app.\n\nNo personal identifiable'
                      ' information is gathered and you can opt out at any time'
                      ' with this setting.',
                  style: Styles.subText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
