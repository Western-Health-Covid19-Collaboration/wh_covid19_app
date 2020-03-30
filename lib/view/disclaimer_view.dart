import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Widget build(BuildContext context) {

    /// Agree button - button a user taps to agree to the disclaimer
    final Widget _agreeButton = Container(
        height: 46,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: RaisedButton(
          child: const Text(
            Strings.disclaimerButtonAgreeText,
            style: Styles.textH5,
          ),
          color: AppColors.green500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          onPressed: () {
            // Write agreement of disclaimer to device storage to persist this decision
            _setAgreed();
            // Make sure user cannot us back to return to the disclaimer once accepted
            Navigator.pushReplacementNamed(context, Routes.home);
          },
        ),
    );

    /// Decline button - button a user taps to agree to the disclaimer but only for Android
    /// Apple Human Interface Guidelines state that applications should not exit themselves.
    final Widget _declineButton = (Platform.isIOS) ? Container() :
      Container(
        height: 46,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: RaisedButton(
          child: const Text(
            Strings.disclaimerButtonDeclineText,
            style: Styles.textH5,
          ),
          color: AppColors.green500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          onPressed: () {
            // If user declines close the app
            //Navigator.pop(context);
            // TODO - iOS issue because On iOS, calls to this method are ignored because of Apple's human interface
            // TODO - guidelines state that applications should not exit themselves.
            // TODO - This is workaround to close the app, should just be able to pop the route, but issue caused in
            //  intro_router.dart, need to investigate but suspect due to empty Container() returned.
            SystemNavigator.pop();
          },
        ),
      );

    // Content of the page
    final _content = Container(
      padding: const EdgeInsets.all(16),
      child: const Text(
        Strings.disclaimerBody,
        style: Styles.textLegal,
        //style: TextStyle(fontSize: 14.0),
      ),
    );

    Widget _disclaimerScrollingContent(BuildContext context) {
      return LayoutBuilder(
        builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    _content,
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: Styles.appBarIconTheme,
        automaticallyImplyLeading: false,
        title: Text(
          Strings.disclaimerTitle,
          style: Styles.textH5,
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Widget to hold content of the right size, with white space for tall height screens and yet scrolls for
          // short height screens
          _disclaimerScrollingContent(context),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              //height: 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _agreeButton,
                  _declineButton,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // When user agrees to disclaimer, persist values for that agreement and version of disclaimer to storage
  Future<void> _setAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$Strings.settingDisclaimerAgreed', true);
    await prefs.setString('$Strings.settingDisclaimerVersion', Strings.disclaimerVersion);
  }

}
