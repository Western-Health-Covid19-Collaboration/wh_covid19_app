import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes.dart';
import '../style.dart';
import '../utils/storage.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // List to hold the widgets for OnBoarding screen
  static List<Widget> onboardingPages = [];

  // controller for the PageView of all pages
  PageController _controller;
  double currentPageValue;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    currentPageValue = 0.0;
    _controller.addListener(() {
      setState(() {
        currentPageValue = _controller.page;
      });
    });
    _buildOnboardingPages();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _buildOnboardingPages() {
    onboardingPages.add(
      OnboardingPage(
        graphicAsset: SvgPicture.asset(
          'assets/images/onboarding/staff-use.svg',
          height: 80,
          color: AppColors.backgroundBlue,
        ),
        title: 'Hospital Staff Use Only',
        subtitle: 'This app is for Western Health clinicians and hospital '
            'staff use ONLY',
      ),
    );

    onboardingPages.add(
      OnboardingPage(
        graphicAsset: SvgPicture.asset(
          'assets/images/onboarding/educational.svg',
          height: 80,
          color: AppColors.purple50,
        ),
        title: 'Educational Use Only',
        subtitle:
            'Western Health Anaesthesia COVID-19 (WHAC19) is an educational tool and interactive cognitive aid for Western Health '
            'anaesthetists and ICU doctors who are managing patients with COVID-19.'
            '\n\nWe want to protect our staff from infection risk and ensure excellent patient '
            'care. WHAC19 aims to provide a really quick, usable means to '
            'access the core information.️',
      ),
    );

    onboardingPages.add(
      OnboardingPage(
        graphicAsset: SvgPicture.asset(
          'assets/images/onboarding/reference.svg',
          height: 80,
          color: AppColors.backgroundGreen,
        ),
        title: 'Content for Microsite',
        subtitle: 'To ensure you have the latest up-to-date information on '
            'Western Health\'s Coronavirus guidelines.\n\n https://coronavirus.wh.org.au/',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemCount: onboardingPages.length,
            itemBuilder: (BuildContext context, int index) {
              return onboardingPages[index % onboardingPages.length];
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Show Previous only when get completely off the first page
                if (currentPageValue >= 1.0)
                  Container(
                    width: 120.0,
                    child: FlatButton(
                      onPressed: () {
                        if (_controller.hasClients) {
                          _controller.previousPage(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 400),
                          );
                        }
                      },
                      child: const Text(
                        '< PREVIOUS',
                      ),
                    ),
                  )
                else
                  Container(width: 120.0),
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: DotsPageIndicator(
                    controller: _controller,
                    itemCount: onboardingPages.length,
                  ),
                ),
                // Show Next until last page then show Finish button
                // Only when fully to the last page
                Container(
                  width: 120.0,
                  child: (currentPageValue < onboardingPages.length - 1)
                      ? FlatButton(
                          onPressed: () {
                            if (_controller.hasClients) {
                              _controller.nextPage(
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 400),
                              );
                            }
                          },
                          child: const Text(
                            'NEXT >',
                          ),
                        )
                      : FlatButton(
                          onPressed: () {
                            // When onboarding complete and user presses
                            // button then navigate to home screen
                            if (_controller.hasClients) {
                              // Set onboarded for device storage
                              Settings.writeOnboarded(true);
                              // Ensure cannot return to onboarding once done
                              Navigator.pushReplacementNamed(
                                  context, Routes.home);
                            }
                          },
                          child: const Text(
                            'FINISH >',
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final Widget graphicAsset;
  final String title;
  final String subtitle;

  const OnboardingPage({this.graphicAsset, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          graphicAsset,
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 28.0),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class DotsPageIndicator extends AnimatedWidget {
  const DotsPageIndicator({
    this.controller,
    this.itemCount,
    this.color = Colors.grey, // changed from old syntax of : to =
  }) : super(listenable: controller);

  // the PageController that this DotsIndicator is representing.
  final PageController controller;

  // number of items managed by the PageController
  final int itemCount;

  // color of dots defaults above
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.4;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    final currentPage = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    final zoom = 1.0 + (_kMaxZoom - 1.0) * currentPage;

    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
