import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles.dart';

class NotificationBanner extends StatelessWidget {
  final SvgPicture icon;
  final String message;
  final Color backgroundColor;

  const NotificationBanner(
      {this.icon, @required this.message, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
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
                  Text(
                    message,
                    style: Styles.textSemiBold,
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
