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
            automaticallyImplyLeading: false,
            expandedHeight: 100,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Western Health',
                      style: appBarTextStyle,
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: appBarColor,
            iconTheme: appBarIconTheme,
            floating: true,
            pinned: true,
            snap: false,
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
                title: 'ICU Non-Intensivist',
                cards: icu,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
