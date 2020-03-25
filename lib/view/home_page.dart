import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/view/info_view.dart';
import 'package:wh_covid19/widget/card_container.dart';

class HomePage extends StatelessWidget {
  final Widget mainLogo =
      SvgPicture.asset('assets/images/main_logo.svg', height: 24);

  Widget _renderBackgroundContainer(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Widget mainHeader = SvgPicture.asset(
      'assets/images/main_header.svg',
      width: size.width,
    );
    return Positioned(
        top: 0,
        left: 0,
        child: Container(width: size.width, child: mainHeader));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.appBackground,
        body: Builder(builder: (context) {
      return Stack(
        children: <Widget>[
          _renderBackgroundContainer(context),
          CustomScrollView(
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
                        mainLogo,
                        IconButton(
                          icon: Icon(
                            Icons.info_outline,
                            color: AppColors.homeAppBarIcon,
                          ),
                          onPressed: () => InfoView.navigateTo(context),
                        )
                      ],
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                iconTheme: AppStyles.appBarIconTheme,
                floating: true,
                pinned: true,
                snap: false,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(height: 12),
                  CardContainer(
                    title: 'Look After Yourself',
                    cards: staffWelfare,
                  ),
                  CardContainer(
                    title: 'Intubations',
                    cards: intubation,
                  ),
                  CardContainer(
                    title: 'ICU',
                    cards: icu,
                  ),
                  // Make sure the bottom CardContainer has room to breathe.
                  SizedBox(height: 16),
                ]),
              ),
            ],
          ),
        ],
      );
    }));
  }
}
