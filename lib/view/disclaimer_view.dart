import 'package:flutter/material.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';

class DisclaimerView extends StatelessWidget {
  final String _title = 'Terms & Conditions';

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
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        iconTheme: AppStyles.appBarIconTheme,
        automaticallyImplyLeading: false,
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
            _agreeButton,
          ],
        ),
      ),
    );
  }
}
