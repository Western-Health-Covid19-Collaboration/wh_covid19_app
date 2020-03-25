import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';

class DisclaimerView extends StatefulWidget {
  @override
  _DisclaimerViewState createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView>
    with SingleTickerProviderStateMixin {
  final String _title = 'Disclaimer and conditions of use';

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final _content = Container(
      padding: EdgeInsets.all(16),
      child: Text(
        disclaimerBody,
        style: AppStyles.textP,
        //textAlign: TextAlign.justify,
      ),
    );

    final _agreeButton = Container(
      //padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      margin: EdgeInsets.only(left:16, right:16, bottom:16),
      height: 44.0,
      child: RaisedButton(
        child: Text(
          'I Agree',
          style: AppStyles.textH5,
        ),
        color: AppColors.green500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: () {
          _setAgreed();
          Navigator.pushNamed(context, Routes.home);
        },
      ),
    );

    final _agreedText = Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'You have already agreed 👍',
        style: AppStyles.textH5,
        textAlign: TextAlign.center,
      ),
    );

    final _scrollDown = Container(
      //width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.green50,
        borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      child: Text(
        'Scroll down to agree',
        style: AppStyles.textP,
        textAlign: TextAlign.center,
      ),
    );

    return FutureBuilder<bool>(
        future: _checkAgreed(),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: AppStyles.appBarIconTheme,
              automaticallyImplyLeading: snapshot.data,
              title: Text(
                _title,
                style: AppStyles.textH5,
              ),
            ),
            body: Theme(
              data: ThemeData(accentColor: AppColors.green500),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    child: ListView(
                      children: <Widget>[
                        _content,
                        !snapshot.data ? _agreeButton : _agreedText,
                      ],
                    ),
                    onVerticalDragDown: (details) {
                      _animationController.forward();
                    },
                  ),
                  FadeTransition(opacity: _animation, child: _scrollDown)
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

  Future<void> _setAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('disclaimer_agreed', true);
    await prefs.setBool('disclaimer_first_view', true);
  }
}
