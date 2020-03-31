import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../hard_data.dart';
import '../routes.dart';
import '../style.dart';

class DisclaimerView extends StatefulWidget {
  @override
  _DisclaimerViewState createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView>
    with SingleTickerProviderStateMixin {
  final String _title = 'Disclaimer and conditions of use';

  // Content of the page
  final _content = Container(
    padding: const EdgeInsets.all(16),
    child: const Text(
      disclaimerBody,
      style: AppStyles.textLegal,
      //textAlign: TextAlign.justify,
    ),
  );

  // Content to show at the bottom instead of [_agreedButton]
  final _agreedText = Container(
    height: 44,
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: const Text(
      'You have already agreed 👍',
      style: AppStyles.textH5,
      textAlign: TextAlign.center,
    ),
  );

  // Floating container indicating to scroll down to agree
  final _scrollDownToAgree = IgnorePointer(
    child: Container(
      decoration: const BoxDecoration(
          color: AppColors.green50,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Scroll down to agree',
        style: AppStyles.textLegal,
        textAlign: TextAlign.center,
      ),
    ),
  );

  // Floating container indicating to scroll down
  final _scrollDown = IgnorePointer(
    child: Container(
      decoration: const BoxDecoration(
          color: AppColors.green50,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Scroll down',
        style: AppStyles.textP,
        textAlign: TextAlign.center,
      ),
    ),
  );

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    // Bottom button to agree t&c
    final _agreeButton = Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      height: 44.0,
      child: RaisedButton(
        color: AppColors.green500,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: () {
          _setAgreed();
          Navigator.pushReplacementNamed(context, Routes.home);
        },
        child: const Text(
          'I Agree',
          style: AppStyles.textH5,
        ),
      ),
    );

    return FutureBuilder<bool>(
        future: _checkAgreed(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return WillPopScope(
            // Prevent back button exiting disclaimer on Android
            onWillPop: () async {
              return _closeDisclaimerOrCloseApp(context, snapshot.data);
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: AppStyles.appBarIconTheme,
                automaticallyImplyLeading: snapshot.data ?? true,
                title: Text(
                  _title,
                  style: AppStyles.textH5,
                ),
              ),
              body: MediaQuery.of(context).size.height < 600
                  ? Theme(
                      data: ThemeData(accentColor: AppColors.green500),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          NotificationListener<ScrollUpdateNotification>(
                            onNotification: (scrollNotification) {
                              _animationController.forward();
                              return true;
                            },
                            child: ListView(
                              children: <Widget>[
                                _content,
                                if (!snapshot.data)
                                  _agreeButton
                                else
                                  _agreedText,
                              ],
                            ),
                          ),
                          FadeTransition(
                              opacity: _animation,
                              child: !snapshot.data
                                  ? _scrollDownToAgree
                                  : _scrollDown)
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _content,
                        if (!snapshot.data) _agreeButton else _agreedText,
                      ],
                    ),
            ),
          );
        });
  }

  Future<bool> _checkAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('disclaimer_agreed') ?? false;
  }

  // Close the app or close the disclaimer based on whether the user has
  // agreed to the terms or not
  bool _closeDisclaimerOrCloseApp(
      BuildContext context, bool _hasAgreedToTerms) {
    if (_hasAgreedToTerms) {
      return _closeDisclaimer(context);
    } else {
      // Close App
      exit(0);
      return false;
    }
  }

  bool _closeDisclaimer(BuildContext context) {
    if (Navigator.canPop(context)) {
      // Pop the disclaimer if we are not in the top route
      return true;
    } else {
      // Replace with home if we are in the top route
      Navigator.pushReplacementNamed(context, Routes.home);
      return false;
    }
  }

  Future<void> _setAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('disclaimer_agreed', true);
    await prefs.setBool('disclaimer_first_view', true);
  }
}
