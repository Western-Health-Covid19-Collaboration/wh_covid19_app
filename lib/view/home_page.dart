import 'package:flutter/material.dart';

import '../hard_data.dart';
import '../style.dart';
import '../widget/card_container.dart';
import 'info_view.dart';

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
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
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
              const CardContainer(
                title: 'Look After Yourself',
                cards: staffWelfare,
              ),
              CardContainer(
                title: 'Airway',
                cards: intubation,
              ),
              const CardContainer(
                title: 'ICU',
                cards: icu,
              ),
              // Make sure the bottom CardContainer has room to breathe.
              const SizedBox(height: 16),
            ]),
          ),
        ],
      ),
    );
  }
}
