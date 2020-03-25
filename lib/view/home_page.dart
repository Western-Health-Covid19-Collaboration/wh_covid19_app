import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/view/info_view.dart';
import 'package:wh_covid19/widget/card_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;

  Widget _renderBackgroundContainer(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // Ensure that the image uses the full parent width
    final Widget mainHeader = SvgPicture.asset(
      'assets/images/main_header.svg',
      width: size.width,
    );
    return Container(width: size.width, child: mainHeader);
  }

  /**
   * Renders a stack with a single child node.
   */
  Widget _renderStack(
    BuildContext context,
    Widget child,
  ) {
    return Stack(
      children: <Widget>[_renderBackgroundContainer(context), child],
    );
  }

  Widget _renderList(BuildContext context) {
    return SliverList(
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
        SizedBox(height: 12),
      ]),
    );
  }

  Widget _renderBody(BuildContext context) {
    var appBarHeight = 70, logoHeight = 24;

    final Widget mainLogo = SvgPicture.asset('assets/images/main_logo.svg',
        height: logoHeight.toDouble());

    var appBarBottom = appBarHeight.toDouble() - logoHeight.toDouble();

    var scrollPos = _scrollPosition.round();

    var percentage = scrollPos < appBarBottom
        ? ((scrollPos) / appBarBottom.toDouble())
        : 1.00;

    return Builder(builder: (context) {
      final _scrollController = PrimaryScrollController.of(context);

      _scrollController.addListener(() {
        setState(() {
          _scrollPosition = _scrollController.position.pixels;
        });
      });

      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: appBarHeight.toDouble(),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight.toDouble()),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    mainLogo,
                    IconButton(
                      icon:
                          Icon(Icons.info_outline, color: AppColors.appBarIcon),
                      onPressed: () => InfoView.navigateTo(context),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Color.fromRGBO(255, 255, 255, percentage),
            iconTheme: AppStyles.appBarIconTheme,
            floating: true,
            pinned: true,
            snap: false,
          ),
          _renderList(context)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.appBackground,
        body: Builder(builder: (context) {
      return _renderStack(context, _renderBody(context));
    }));
  }
}
