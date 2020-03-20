import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:photo_view/photo_view.dart';

class StaffWelfare extends StatefulWidget {
  @override
  _StaffWelfare createState() => _StaffWelfare();
}

class _StaffWelfare extends State<StaffWelfare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Staff Welfare Advice',
        ),
        backgroundColor: Color(0xFF7BC6DD),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/WHBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            imageProvider: AssetImage('images/Self_care_1_ICS.jpg'),
          ),
        ),
      ),
    );
  }
}
