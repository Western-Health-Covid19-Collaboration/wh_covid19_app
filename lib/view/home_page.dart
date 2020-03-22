import 'package:flutter/material.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/card_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: appBarIconTheme,
        elevation: 0.0,
        title: Text(
          'Weastern Healt',
          style: appBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CardContainer(
                title: 'Look After Yourself',
                cards: staffWelfare,
              ),
              CardContainer(
                title: 'Intubations',
                cards: intubation,
              ),
              CardContainer(
                title: 'ICU Non-Intesivist',
                cards: icu,
              ),
              CardContainer(
                title: 'Additional Resources',
                cards: info,
              )
            ],
          ),
        ),
      ),
    );
  }
}
