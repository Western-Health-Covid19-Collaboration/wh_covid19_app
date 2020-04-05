import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../hard_data.dart';
import '../../style.dart';
import '../../utils/url_utils.dart';
import '../../widget/reusable_card.dart';

class YourWelfareView extends StatelessWidget {
  final _title = 'Your Welfare';

  final card = const ReusableCard(
    title: 'Phases of Pandemic and suggestions for self-care',
    description: '',
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: Text(
          _title,
          style: Styles.textSemiBold.copyWith(color: AppColors.blackAlpha800),
        ),
        actions: <Widget>[
          IconButton(
            icon: Stack(
              children: <Widget>[
                Align(alignment: Alignment.center, child: Icon(Icons.call)),
                Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.call_made,
                      size: 20,
                    ))
              ],
            ),
            onPressed: () => UrlUtils.launchWithBrowser(whURL),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: AppColors.grey50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSpacer(),
                  const Text("It's okay to not be okay.", style: Styles.textH1),
                  _buildSpacer(),
                  const Text('Please look after yourself.',
                      style: Styles.textH2),
                  _buildSpacer(),
                  _buildSpacer(),
                  const Text('Basic Tips', style: Styles.textH3),
                  _buildIconTextRow(
                      const Text('🛑'), 'STOP, BREATHE then think'),
                  _buildIconTextRow(const Text('🗞'), 'Limit news intake'),
                  _buildSpacer(),
                  const Text('Take Care of Basic Needs', style: Styles.textH3),
                  _buildIconTextRow(const Text('🛌'), 'Rest'),
                  _buildIconTextRow(const Text('🥦'), 'Eat well'),
                  _buildIconTextRow(
                      const Text('🏃‍'), 'Engage in physical activity'),
                  _buildIconTextRow(
                    const Text('🥰'),
                    'Stay in contact with loved ones',
                  ),
                  _buildIconTextRow(
                    const Text('🧻'),
                    'Avoid unhelpful coping strategies (Tobacco, alcohol or other drugs)',
                  ),
                  _buildIconTextRow(
                    const Text('🔋'),
                    'Consider psychological energy levels. “Fill up” after “Emptying the tank”',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: card,
          ),
        ],
      ),
    );
  }

  Widget _buildIconTextRow(Widget icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: icon,
          ),
          Expanded(
              child: Text(text,
                  style:
                      Styles.textP.copyWith(color: AppColors.blackAlpha900)))
        ],
      ),
    );
  }

  Widget _buildSpacer({double height = 16}) => Container(height: height);
}
