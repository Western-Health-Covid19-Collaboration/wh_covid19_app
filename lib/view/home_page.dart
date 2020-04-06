import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../hard_data.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/color.dart';
import '../utils/system_bars.dart';
import '../widget/card_container.dart';
import 'info_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;

  Widget _renderBackgroundContainer(BuildContext context) {
    // Ensure that the image uses the full parent width
    final width = MediaQuery.of(context).size.width;

    final Widget mainHeader = SvgPicture.asset(
      'assets/images/main_header.svg',
      width: width,
      fit: BoxFit.fill,
    );

    return Container(
      width: width,
      child: mainHeader,
    );
  }

  /// Renders a stack with a single child node.
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
      delegate: SliverChildListDelegate(const [
        SizedBox(height: 12),
        CardContainer(
          title: Strings.homeHeading1,
          cards: staffWelfare,
          containerLayout: CardsLayout.twoRow,
        ),
        CardContainer(
          title: Strings.homeHeading2,
          cards: airway,
          containerLayout: CardsLayout.threeColumn,
        ),
        CardContainer(
          title: Strings.homeHeading3,
          cards: icu,
          containerLayout: CardsLayout.threeDoubleRowBigTop,
        ),
        // Make sure the bottom CardContainer has room to breathe.
        SizedBox(height: 12),
      ]),
    );
  }

  Widget _renderBody(BuildContext context) {
    const appBarHeight = 70;
    const logoHeight = 42;

    final Widget mainLogo = SvgPicture.asset('assets/images/main_logo.svg',
        height: logoHeight.toDouble());

    final appBarBottom = appBarHeight.toDouble() - logoHeight.toDouble();

    final scrollPos = _scrollPosition.round();

    final percentage = scrollPos < appBarBottom
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
            // Warning brightness interacts with SystemUiOverlayStyle
            // See system_bars.dart comments
            brightness: Brightness.light,
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
                      icon: Icon(Icons.info_outline,
                          color: generateIconColor(AppColors.homeAppBarIcon,
                              AppColors.appBarIcon, percentage)),
                      onPressed: () => InfoView.navigateTo(context),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: AppColors.dynamicAppBarBackground(percentage),
            iconTheme: Styles.appBarIconTheme,
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
    // AnnotatedRegion set the system bar styles
    return AnnotatedRegion(
      value: systemBarStyle(context),
      sized: false,
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return _renderStack(context, _renderBody(context));
          },
        ),
      ),
    );
  }
}
