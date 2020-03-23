import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class YourWelfareView extends StatelessWidget {
  final _title = 'Your Welfare';
  static const _phoneNumber = '+61398000000';

  final card =
    ReusableCard(
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
            onPressed: _makeCall,
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
                  Text('It''s okay to not be okay.', style: AppStyles.textH1),
                  _buildSpacer(),
                  Text('Please look after yourself.', style: AppStyles.textH2),
                  _buildSpacer(),
                  _buildSpacer(),
                  Text('Basic Tips', style: AppStyles.textH3),
                  _buildIconTextRow('STOP, BREATHE then think'),
                  _buildIconTextRow('Limit news intake'),
                  _buildSpacer(),
                  Text('Take Care of Basic Needs', style: AppStyles.textH3),
                  _buildIconTextRow('Rest'),
                  _buildIconTextRow('Eat well'),
                  _buildIconTextRow('Engage in physical activity'),
                  _buildIconTextRow('Stay in contact with loved ones'),
                  _buildIconTextRow('Avoid unhelpful coping strategies (Tobacco, alcohol or other drugs)'),
                  _buildIconTextRow('Consider psychological energy levels. “Fill up” after “Emptying the tank'),
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

  Widget _buildIconTextRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.info),
          ),
          Expanded(child: Text(text, style: AppStyles.textP,)),
        ],
      ),
    );
  }

  Future<void> _makeCall() async {
    const url = 'tel:$_phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildSpacer({double height = 16}) => Container(height: height);
}
