import 'package:flutter/material.dart';
import 'package:wh_covid19/contact_launcher.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class YourWelfareView extends StatelessWidget {
  final _title = 'Your Welfare';

  final card = ReusableCard(
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
        iconTheme: AppStyles.appBarIconTheme,
        title: Text(
          _title,
          style: AppStyles.appBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () => ContactLauncher.launchWithBrowser(whURL),
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
                  Text('It\'s okay to not be okay.', style: AppStyles.textH1),
                  _buildSpacer(),
                  Text('Please look after yourself.', style: AppStyles.textH2),
                  _buildSpacer(),
                  _buildSpacer(),
                  Text('Basic Tips', style: AppStyles.textH3),
                  _buildIconTextRow(Text('🛑'), 'STOP, BREATHE then think'),
                  _buildIconTextRow(Text('🗞'), 'Limit news intake'),
                  _buildSpacer(),
                  Text('Take Care of Basic Needs', style: AppStyles.textH3),
                  _buildIconTextRow(Text('🛌'), 'Rest'),
                  _buildIconTextRow(Text('🥦'), 'Eat well'),
                  _buildIconTextRow(Text('🏃‍'), 'Engage in physical activity'),
                  _buildIconTextRow(
                    Text('🥰'),
                    'Stay in contact with loved ones',
                  ),
                  _buildIconTextRow(
                    Text('🧻'),
                    'Avoid unhelpful coping strategies (Tobacco, alcohol or other drugs)',
                  ),
                  _buildIconTextRow(
                    Text('🔋'),
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
          Expanded(child: Text(text, style: AppStyles.textP)),
        ],
      ),
    );
  }

  Widget _buildSpacer({double height = 16}) => Container(height: height);
}
