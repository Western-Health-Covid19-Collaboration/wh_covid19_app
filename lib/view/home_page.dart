import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../hard_data.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/color.dart';
import '../utils/firebase.dart';
import '../utils/system_bars.dart';
import '../widget/call_button.dart';
import '../widget/card_container.dart';
import '../widget/reusable_card.dart';
import 'info_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    Analytics.analyticsAppOpen();
  }

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
      children: <Widget>[
        _renderBackgroundContainer(context),
        child,
      ],
    );
  }

  Widget _renderList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 12),
          CardContainer(
            title: Strings.homeHeading1,
            cards: staffWelfare
                .map(
                  (c) => ReusableCard.fromData(
                    card: c,
                    color: Colors.white,
                    margin: const EdgeInsets.all(0.0),
                  ),
                )
                .toList(),
            containerLayout: CardsLayout.twoRow,
          ),
          CardContainer(
            title: Strings.homeHeading2,
            cards: airway
                .map(
                  (c) => ReusableCard.fromData(
                    card: c,
                    color: AppColors.backgroundGreen,
                    margin: const EdgeInsets.all(0.0),
                    height: 70,
                  ),
                )
                .toList(),
            containerLayout: CardsLayout.threeColumn,
          ),
          CardContainer(
            title: Strings.homeHeading3,
            cards: icu
                .map(
                  (c) => ReusableCard.fromData(
                    card: c,
                    color: AppColors.backgroundBlue,
                  ),
                )
                .toList(),
            containerLayout: CardsLayout.threeDoubleRowBigTop,
          ),
          CardContainer(
            title: Strings.homeHeading4,
            cards: resources
                .map(
                  (c) => ReusableCard.fromData(
                    card: c,
                    color: AppColors.purple50,
                  ),
                )
                .toList(),
            containerLayout: CardsLayout.twoRow,
          ),
          // Make sure the bottom CardContainer has room to breathe.
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    const appBarHeight = 70.0;
    const logoHeight = 42.0;

    final Widget mainLogo = SvgPicture.asset(
      'assets/images/main_logo.svg',
      height: logoHeight,
    );
    const appBarBottom = appBarHeight - logoHeight;
    // On iOS scroll position can be negative due to over scroll
    // So prevent negative scrollPos which results in a negative percentage
    final scrollPos = _scrollPosition.isNegative ? 0.0 : _scrollPosition;
    final percentage =
        scrollPos < appBarBottom ? scrollPos / appBarBottom : 1.0;

    return Builder(
      builder: (context) {
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
              primary: true,
              automaticallyImplyLeading: false,
              expandedHeight: appBarHeight,
              centerTitle: false,
              forceElevated: false,
              elevation: 0.0,
              backgroundColor: AppColors.dynamicAppBarBackground(percentage),
              iconTheme: Styles.appBarIconTheme,
              floating: true,
              pinned: true,
              snap: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(appBarHeight),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mainLogo,
                      const Spacer(),
                      GestureDetector(
                        onTap: () => InfoView.navigateTo(context),
                        child: Icon(
                          Icons.info_outline,
                          size: 24,
                          color: generateIconColor(
                            AppColors.homeAppBarIcon,
                            AppColors.appBarIcon,
                            percentage,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      CallButton(whURL,
                          color: generateIconColor(
                            AppColors.homeAppBarIcon,
                            AppColors.appBarIcon,
                            percentage,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            _renderList(context)
          ],
        );
      },
    );
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
