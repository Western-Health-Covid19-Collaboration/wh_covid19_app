import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../hard_data.dart';
import '../../routes.dart';
import '../../style.dart';
import '../../widget/reusable_card.dart';

class PPEView extends StatefulWidget {
  static const _cardHeight = 34.0;

  @override
  _PPEViewState createState() => _PPEViewState();
}

class _PPEViewState extends State<PPEView> {
  final title = 'PPE';

  VideoPlayerController _videoController1;
  ChewieController _chewieController1;

  VideoPlayerController _videoController2;
  ChewieController _chewieController2;

  final puttingOnCards = <Widget>[
    _buildVerticalSpacer(),
    const ReusableCard(
      title: 'Step By Step Guide',
      color: AppColors.backgroundGreen,
      height: PPEView._cardHeight,
      routeTo: '/ppe/on',
    ),
    _buildVerticalSpacer(),
    const ReusableCard(
      title: 'Infographic',
      color: AppColors.backgroundGreen,
      height: PPEView._cardHeight,
    ),
    _buildVerticalSpacer(),
  ];

  static int method1Steps = ppeOffMethod1Steps.length;
  static int method2Steps = ppeOffMethod2Steps.length;

  final takingOffCards = <Widget>[
    _buildVerticalSpacer(),
    Row(
      children: <Widget>[
        Expanded(
            child: ReusableCard(
          title: 'Method 1',
          description: '$method1Steps Steps',
          height: 40,
          routeTo: Routes.ppeOffGuidance1,
          color: AppColors.backgroundBrown,
        )),
        Expanded(
            child: ReusableCard(
          title: 'Method 2',
          description: '$method2Steps Steps',
          height: 40,
          routeTo: Routes.ppeOffGuidance2,
          color: AppColors.backgroundBrown,
        ))
      ],
    ),
    const ReusableCard(
      title: 'Infographic',
      color: AppColors.backgroundBrown,
      height: PPEView._cardHeight,
    ),
    _buildVerticalSpacer(),
  ];

  static Widget _buildVerticalSpacer() => Container(height: 8);

  static Widget _buildVideoPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _videoController1 =
        VideoPlayerController.asset('assets/videos/wh_icu_donning.mp4');
    _chewieController1 = ChewieController(
      videoPlayerController: _videoController1,
      aspectRatio: 16 / 9,
      autoPlay: false,
      autoInitialize: true,
      placeholder: _buildVideoPlaceholder(),
    );
    _videoController2 =
        VideoPlayerController.asset('assets/videos/wh_icu_doffing.mp4');
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
        backgroundColor: AppColors.appBarBackground,
        iconTheme: AppStyles.appBarIconTheme,
        title: Text(
          title,
          style: AppStyles.appBarTextStyle,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildHeader('Putting on Personal Protective Equipment'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chewie(controller: _chewieController1),
            ),
            ...puttingOnCards,
            _buildHeader('Taking off Personal Protective Equipment'),
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
        child: Text(text, style: AppStyles.cardContainerTextStyle),
      ),
    );
  }
}
