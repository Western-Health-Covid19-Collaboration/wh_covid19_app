import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class PPEView extends StatefulWidget {
  static final _cardHeight = 34.0;

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
    ReusableCard(
      title: 'Step By Step Guide',
      color: AppColors.backgroundGreen,
      height: PPEView._cardHeight,
    ),
    _buildVerticalSpacer(),
    ReusableCard(
      title: 'Infographic',
      color: AppColors.backgroundGreen,
      height: PPEView._cardHeight,
    ),
    _buildVerticalSpacer(),
  ];

  final takingOffCards = <Widget>[
    _buildVerticalSpacer(),
    ReusableCard(
      title: 'Step By Step Guide',
      color: AppColors.backgroundBrown,
      height: PPEView._cardHeight,
    ),
    _buildVerticalSpacer(),
    ReusableCard(
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
        borderRadius: BorderRadius.all(Radius.circular(8)),
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
        padding: EdgeInsets.all(16),
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
