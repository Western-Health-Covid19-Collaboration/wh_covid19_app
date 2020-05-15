import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../hard_data.dart';
import '../models/disclaimer_model.dart';
import '../routes.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/storage.dart';
import '../utils/system_bars.dart';

// *** WARNING ***
// When disclaimerBody changes in any way, increment disclaimerVersion by one
/// Disclaimer screen presented on app startup until the user agrees to the disclaimer
class DisclaimerView extends StatefulWidget {
  @override
  _DisclaimerViewState createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView> {
  // Check persisted values for disclaimer agreement if they exist
  Future<DisclaimerDetails> _checkDisclaimerAgreed() async {
    final disclaimerValues = await Settings.readDisclaimerAgreed();

    // Format the datStamp to be more user readable
    if (disclaimerValues.dateStamp != '') {
      disclaimerValues.dateStamp = DateFormat.yMMMd()
          .add_jm()
          .format(DateTime.parse(disclaimerValues.dateStamp));
    }

    return disclaimerValues;
  }

  /// Disclaimer text content section of the screen that scrolls regardless of screen height/density
  Widget _disclaimerScrollingContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, viewportConstraints) {
        // Prevent overscroll indicator showing when scroll to bottom of disclaimer
        // Workaround currently to color the bottom container to hide the overscroll
        // TODO - Flutter open issue so not working: https://github.com/flutter/flutter/issues/49038
        return GlowingOverscrollIndicator(
          color: AppColors.green500,
          axisDirection: AxisDirection.down,
          showLeading: true,
          showTrailing: false,
          child: Scrollbar(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 30.0),
                            child: Text(
                              '🛑 ✋',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 44.0),
                            ),
                          ),
                        ),
                        const Text(
                          'This app is for Western Health clinicians and hospital staff use'
                          ' ONLY\n',
                          style: Styles.textH3,
                        ),
                        const Text(
                          'Western Health Anaesthesia COVID-19 (WHAC19) is an educational tool and interactive cognitive aid for Western Health '
                          'anaesthetists and ICU doctors 👩‍⚕ 👨‍⚕ who are managing patients with COVID-19 🤒 .'
                          '\n\nWe want to protect our staff from infection risk 🌡 and ensure excellent patient '
                          'care 🏥. WHAC19 aims to provide a really quick, '
                          'usable means to access the core information ℹ️'
                          ' for this.'
                          '\n\nIt is created using content developed by contributing members of the Western Health COVID-19 Guidelines Working Group. '
                          ' All content of the app is informally peer-reviewed.',
                          style: Styles.textH5,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Please refer to ',
                                style: Styles.textH5,
                              ),
                              TextSpan(
                                text: whCoronavirusInfoURL,
                                style: Styles.textH5Hyperlink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(whCoronavirusInfoURL);
                                  },
                              ),
                              const TextSpan(
                                text:
                                    ' to ensure you have the latest up-to-date information on Western Health\'s Coronavirus guidelines.\n\n',
                                style: Styles.textH5,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 14.0),
                              child: const Text(
                                '✋',
                                style: Styles.textH3,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'Please keep in mind',
                                    style: Styles.textH3,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'This is not a comprehensive source nor can we guarantee it is completely up to date at '
                                    'the time of use 📱.\n\n\ '
                                    'WHAC19 gathers analytics and crash data which is used to improve the app.  For more information and to opt out, go to Information > Privacy\n\n',
                                    style: Styles.textBody,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Full Disclaimer',
                          style: Styles.textH3,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          Strings.disclaimerBody,
                          style: Styles.textP,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Agree button - only at app startup button a user taps to agree to the disclaimer
  Widget _agreeButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      height: 46.0,
      child: RaisedButton(
        color: AppColors.green500,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        onPressed: () {
          // Write agreement of disclaimer to device storage to persist this decision
          Settings.writeDisclaimerAgreed();
          // Make sure user cannot press back to return to the disclaimer once accepted
          Navigator.pushReplacementNamed(context, Routes.home);
        },
        child: const Text(
          Strings.disclaimerButtonAgreeText,
          style: Styles.textH5,
        ),
      ),
    );
  }

  /// Agree message - only viewed from Information page, shows has agreed to disclaimer, version and date/time agreed
  Widget _agreedMessage(
      BuildContext context, dynamic version, dynamic dateStampString) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: Text(
        '${Strings.disclaimerHaveAgreedText} \nVersion: $version \nDate & time: $dateStampString',
        style: Styles.textFooter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DisclaimerDetails>(
      future: _checkDisclaimerAgreed(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // AnnotatedRegion set the system bar styles
          return AnnotatedRegion(
            value: systemBarStyle(context),
            sized: false,
            child: Scaffold(
              appBar: AppBar(
                // Warning brightness interacts with SystemUiOverlayStyle
                // See system_bars.dart comments
                brightness: Brightness.light,
                backgroundColor: AppColors.appBarBackground,
                iconTheme: Styles.appBarIconTheme,
                elevation: 4.0,
                automaticallyImplyLeading: snapshot.data.agreed,
                title: const Text(
                  Strings.disclaimerTitle,
                  style: Styles.textH5,
                ),
              ),
              body: _disclaimerScrollingContent(context),
              bottomSheet: BottomSheet(
                elevation: 18.0,
                onClosing: () {},
                builder: (context) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  color: Colors.white,
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      if (snapshot.data.agreed == false ||
                          snapshot.data.version !=
                              Strings.disclaimerCurrentVersion)
                        _agreeButton(context)
                      else
                        _agreedMessage(context, snapshot.data.version,
                            snapshot.data.dateStamp),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }, // builder
    );
  } // build
}
