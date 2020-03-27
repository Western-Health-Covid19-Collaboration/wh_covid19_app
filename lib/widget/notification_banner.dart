import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';

class NotificationBanner extends StatelessWidget {
  final SvgPicture icon;
  final String message;

  const NotificationBanner({this.icon, this.message});

  @override
  Widget build(BuildContext context) {
    final notificationHeading = message != null
        ? Text(
            ppeOffWarning,
            style: AppStyles.textSemiBold,
          )
        : Container();

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            icon,
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  notificationHeading
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
