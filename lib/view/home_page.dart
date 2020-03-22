import 'package:flutter/material.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/card_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: appBarColor,
            iconTheme: appBarIconTheme,
            floating: true,
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
          SliverList(
            delegate: SliverChildListDelegate([
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
            ]),
          ),
        ],
      ),
    );
  }
}
