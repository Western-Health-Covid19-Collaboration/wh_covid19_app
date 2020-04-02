import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/disclaimer_model.dart';
import '../routes.dart';
import '../strings.dart';
import '../styles.dart';

/// Disclaimer screen presented on app startup until the user agrees to the disclaimer
class DisclaimerView extends StatefulWidget {
  @override
  _DisclaimerViewState createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // When user agrees to disclaimer, persist values for that agreement, version of disclaimer and date/time to storage
  Future<void> _setAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Strings.settingDisclaimerAgreed, true);
    await prefs.setString(Strings.settingDisclaimerVersion, Strings.disclaimerVersion);
    await prefs.setString(Strings.settingDisclaimerAgreedDateTime, DateTime.now().toString());
  }

  // Check persisted values for disclaimer agreement if they exist
  Future<DisclaimerDetails> _getAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    DisclaimerDetails disclaimerValues = new DisclaimerDetails();

    disclaimerValues.agreed = prefs.getBool(Strings.settingDisclaimerAgreed) ?? false;
    disclaimerValues.version = prefs.getString(Strings.settingDisclaimerVersion) ?? '0';

    final dateStamp = prefs.getString(Strings.settingDisclaimerAgreedDateTime) ?? '';
    if (dateStamp != '') {
      disclaimerValues.dateStamp = DateFormat.yMMMd().add_jm().format(DateTime.parse(dateStamp));
    }

    return disclaimerValues;
  }

  @override
  Widget build(BuildContext context) {
    /// Agree button - button a user taps to agree to the disclaimer
    final Widget _agreeButton = Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
      height: 44.0,
      child: RaisedButton(
        color: AppColors.green500,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: () {
          // Write agreement of disclaimer to device storage to persist this decision
          _setAgreed();
          // Make sure user cannot press back to return to the disclaimer once accepted
          Navigator.pushReplacementNamed(context, Routes.home);
        },
        child: const Text(
          Strings.disclaimerButtonAgreeText,
          style: Styles.textH5,
        ),
      ),
    );

    // Content of the page
    Widget _agreedMessage(dynamic version, dynamic dateStampString) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          '${Strings.disclaimerHaveAgreedText} \nVersion: $version \nDate & time: $dateStampString',
          style: Styles.textLegal,
        ),
      );
    }

    Widget _disclaimerScrollingContent(BuildContext context) {
      return LayoutBuilder(
        builder: (context, viewportConstraints) {
          // Prevent overscroll indicator showing when scroll to bottom of disclaimer as it v=covers button
          // TODO - Flutter framework bug means this does not currently work, bug logged
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
                        children: const <Widget>[
                          Center(
                            child: Text(
                              '🛑 ✋\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 35.0),
                            ),
                          ),
                          Text('This app is for Clinician and hospital staff use ONLY\n', style: Styles.textH3),
                          Text(
                            'WHAC19 is an educational tool and interactive cognitive aid for Western Health '
                            'Anaesthetists and ICU doctors 👩‍⚕ 👨‍⚕ who are managing patients with COVID-19 🤒 .'
                            '\n\nWe want to protect our staff from infection risk 🌡 and ensure excellent patient '
                            'care 🏥. WHAC19 aims to provide a really quick, usable means to access the core information ℹ️ for this.\n',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text('✋ Please keep in mind\n', style: Styles.textH3),
                          Text(
                            'This is not a comprehensive source nor can we guarantee it is completely up to date at '
                            'the time of use 📱.\n\nIt is created using Western Health guidelines, informally '
                            'peer-reviewed and adapted, with permission, from College/Society guidelines.\n\n',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text('🛑 WHAC19 does not constitute official advice\n', style: Styles.textH3),
                          Text(
                            'It is your responsibility to ensure your practice is up to date, contextualised for the '
                            'patient and in accordance with your institution\'s practice 🤓.\n\n',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text('Full Disclaimer\n', style: Styles.textH3),
                          Text(
                            Strings.disclaimerBody,
                            //style: Styles.textLegal,
                            style: TextStyle(fontSize: 14.0),
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

    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4.0,
          iconTheme: Styles.appBarIconTheme,
          automaticallyImplyLeading: false,
          title: Text(
            Strings.disclaimerTitle,
            style: Styles.textH5,
          ),
        ),
        body: FutureBuilder<DisclaimerDetails>(
          future: _getAgreed(),
          builder: (BuildContext context, AsyncSnapshot<DisclaimerDetails> snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  // Widget to hold content of the right size, with white space for tall height screens and yet scrolls for
                  // short height screens
                  _disclaimerScrollingContent(context),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          (snapshot.data.agreed == false)
                              ? _agreeButton
                              : _agreedMessage(snapshot.data.version, snapshot.data.dateStamp),
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
