import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
                        SvgPicture.asset(
                          'assets/images/onboarding/disclaimer.svg',
                          height: 80,
                          color: AppColors.backgroundGreen,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        const Text(
                          Strings.disclaimerHeading,
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

  /// Agree button - only at app startup button a user taps to agree to the
  /// disclaimer. May then transition to onboarding screens or home screen.
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
        onPressed: () async {
          // Write agreement of disclaimer to device storage to persist this decision
          await Settings.writeDisclaimerAgreed();
          // Check to see if the user has previously onboarded
          await Settings.readOnboarded().then((onboarded) {
            if (onboarded) {
              // If already onboarded then go to home and prevent returning
              Navigator.pushReplacementNamed(context, Routes.home);
            } else {
              // else show onboarding screens and prevent returning
              Navigator.pushReplacementNamed(context, Routes.onboarding);
            }
          });
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
