import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';

class DisclaimerView extends StatefulWidget {
  @override
  _DisclaimerViewState createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView> {
  final String _title = 'Terms & Conditions';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _content = Container(
      padding: EdgeInsets.all(16),
      child: Text(
        disclaimerBody,
        style: AppStyles.textP,
        textAlign: TextAlign.justify,
      ),
    );

    final _agreeButton = Padding(
      padding: const EdgeInsets.fromLTRB(48.0, 8, 48.0, 48.0),
      child: FlatButton(
        child: Text(
          'AGREE',
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

    return FutureBuilder<bool>(
        future: _checkAgreed(),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: AppColors.appBackground,
            appBar: AppBar(
              backgroundColor: AppColors.appBarBackground,
              iconTheme: AppStyles.appBarIconTheme,
              automaticallyImplyLeading: snapshot.data,
              title: Text(
                _title,
                style: AppStyles.appBarTextStyle,
              ),
            ),
            body: Theme(
              data: ThemeData(accentColor: AppColors.green500),
              child: ListView(
                children: <Widget>[
                  _content,
                  if (!snapshot.data) _agreeButton,
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
