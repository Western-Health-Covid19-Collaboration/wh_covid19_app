import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../hard_data.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';
import '../../widget/reusable_card.dart';

class PPEView extends StatefulWidget {
  static const _cardHeight = 34.0;

  @override
  _PPEViewState createState() => _PPEViewState();
}

class _PPEViewState extends State<PPEView> {
  static String video1Path = 'assets/videos/wh_icu_donning.mp4';
  static String video2Path = 'assets/videos/wh_icu_doffing.mp4';
  static VideoPlayerController _videoController1;
  static ChewieController _chewieController1;
  static VideoPlayerController _videoController2;
  static ChewieController _chewieController2;
  static int method1Steps = ppeOffMethod1Steps.length;
  static int method2Steps = ppeOffMethod2Steps.length;

  final puttingOnCards = <Widget>[
    _buildVerticalSpacer(),
    const ReusableCard(
      title: Strings.ppeStepByStepTitle,
      color: AppColors.backgroundGreen,
      height: PPEView._cardHeight,
      routeTo: '/ppe/on',
    ),
    _buildVerticalSpacer(),
  ];

  final takingOffCards = <Widget>[
    _buildVerticalSpacer(),
    Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            title: Strings.ppeMethod1Title,
            description: '$method1Steps Steps',
            height: 40,
            routeTo: Routes.ppeOffGuidanceMethod1,
            color: AppColors.purple50,
          ),
        ),
        Expanded(
          child: ReusableCard(
            title: Strings.ppeMethod2Title,
            description: '$method2Steps Steps',
            height: 40,
            routeTo: Routes.ppeOffGuidanceMethod2,
            color: AppColors.purple50,
          ),
        )
      ],
    ),
    _buildVerticalSpacer(),
  ];

  static Widget _buildVerticalSpacer() => Container(height: 8);

  static Widget _buildVideoPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Video 1 controllers
    _videoController1 = VideoPlayerController.asset(video1Path);
    _videoController1.addListener(() {
      // Defined as played if watched to the end
      if (_videoController1.value.position ==
          _videoController1.value.duration) {
        Analytics.analyticsEvent('videoPlay', video1Path);
      }
    });
    _chewieController1 = ChewieController(
      videoPlayerController: _videoController1,
      aspectRatio: 16 / 9,
      autoPlay: false,
      autoInitialize: true,
      placeholder: _buildVideoPlaceholder(),
    );

    // Video 2 controllers
    _videoController2 = VideoPlayerController.asset(video2Path);
    _videoController2.addListener(() {
      // Defined as played if watched to the end
      if (_videoController2.value.position ==
          _videoController2.value.duration) {
        Analytics.analyticsEvent('videoPlay', video2Path);
      }
    });
    _chewieController2 = ChewieController(
      videoPlayerController: _videoController2,
      aspectRatio: 16 / 9,
      autoPlay: false,
      autoInitialize: true,
      placeholder: _buildVideoPlaceholder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.ppeTitle,
          style: Styles.textH5,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildHeader(Strings.ppeDonningTitle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chewie(controller: _chewieController1),
            ),
            ...puttingOnCards,
            _buildHeader(Strings.ppeDoffingTitle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chewie(controller: _chewieController2),
            ),
            ...takingOffCards,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoController1.dispose();
    _videoController2.dispose();
    super.dispose();
  }

  Widget _buildHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 4),
        child: Text(
          text,
          style: Styles.cardContainerTextStyle,
        ),
      ),
    );
  }
}
