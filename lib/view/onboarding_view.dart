import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../hard_data.dart';
import '../models/onboardingPage_model.dart';
import '../routes.dart';
import '../style.dart';
import '../utils/storage.dart';
import '../utils/system_bars.dart';
import '../widget/page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemBarStyle(context),
      sized: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: onboardingPages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: OnboardingPage(
                      onboardingSinglePage:
                          onboardingPages[index % onboardingPages.length]),
                );
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 80.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Show Previous only when get completely off the first page
                    if (currentPageValue >= 1.0)
                      Container(
                        width: 140.0,
                        child: FlatButton(
                          onPressed: () {
                            if (_controller.hasClients) {
                              _controller.previousPage(
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 400),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.keyboard_arrow_left,
                                size: 32,
                                color: Colors.grey,
                              ),
                              Text(
                                'BACK',
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(width: 140.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: DotsPageIndicator(
                        controller: _controller,
                        itemCount: onboardingPages.length,
                      ),
                    ),
                    // Show Next until last page then show Finish button
                    Container(
                      width: 140.0,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'NEXT',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 32,
                                    color: Colors.grey,
                                  ),
                                ],
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'GOT IT',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 32,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingSinglePage onboardingSinglePage;

  const OnboardingPage({this.onboardingSinglePage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          SvgPicture.asset(
            onboardingSinglePage.graphicAssetPath,
            height: 80,
            color: onboardingSinglePage.color,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
          ),
          Text(
            onboardingSinglePage.title,
            style: Styles.textH3,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
          ),
          Text(
            onboardingSinglePage.subTitle,
            style: Styles.textP,
          ),
        ],
      ),
    );
  }
}
