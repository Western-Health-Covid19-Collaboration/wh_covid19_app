import 'package:flutter/material.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/view/info_view.dart';
import 'package:wh_covid19/widget/card_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
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
                      style: AppStyles.appBarTextStyle,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        color: AppColors.appBarIcon,
                      ),
                      onPressed: () => InfoView.navigateTo(context),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: AppColors.appBarBackground,
            iconTheme: AppStyles.appBarIconTheme,
            floating: true,
            pinned: true,
            snap: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(height: 24),
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
              // Make sure the bottom CardContainer has room to breathe.
              SizedBox(height: 16),
            ]),
          ),
        ],
      ),
    );
  }
}
