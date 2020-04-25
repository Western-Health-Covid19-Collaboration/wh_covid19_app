import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../models/home_card.dart';
import '../strings.dart';
import '../style.dart';
import '../widget/cards/reusable_card_base.dart';
import '../widget/reusable_card.dart';

class AcknowledgementsView extends StatelessWidget {
  static const _cards = [
    'References',
    HomeCard(
      title: 'Safe Airway Society',
      description: 'Guidelines and Infographics',
      route: 'https://www.safeairwaysociety.org/covid19/',
    ),
    HomeCard(
      title: 'Intensive Care Society',
      description: 'Wellbeing Guidelines',
      route: 'https://www.ics.ac.uk/ICS/Education/Wellbeing/ICS/Wellbeing'
          '.aspx',
    ),
    HomeCard(
      title: 'Australian New Zealand Intensive Care Society',
      description: 'COVID-19 Guidelines',
      route: 'https://www.anzics.com.au/coronavirus-guidelines/',
    ),
    HomeCard(
      title: 'Western Health Department of Anaesthesia',
      description: 'Policies and procedures available on the microsite',
      route: 'https://whcovid19.wixsite.com/covid19',
    ),
    HomeCard(
      title: 'Western Health Novel Coronavirus Information',
      description: 'COVID-19 Information',
      route: 'https://coronavirus.wh.org.au/',
    ),
    HomeCard(
      title: 'RNS ASCAR (Royal North Shore)',
      description: 'Cognitive Aids and Inforgraphics',
      route: 'https://www.rnsascar.com/',
    ),
    'Acknowledegements'
  ];
  static const _thanksHtml = '''
  So many people have worked together to make this project happen, and helped out in so many ways 🥰
<br/>
<br/>
Firstly a huge thanks to <a href='https://github.com/Western-Health-Covid19-Collaboration/wh_covid19_app#contributors'>all our contributors</a>; Our designers, developers and all the medical staff. Your work is what is making this project happen.
<br/>
<br/>
The entire <a href='https://www.gdgmelbourne.com/'>GDG Melbourne</a> community for pulling together on this.
<br/>
<br/>
Several companies who have provided support and employee time, including <a href='https://www.ittybittyapps.com/'>Itty Bitty Apps</a>, and <a href='https://www.artprocessors.net/'>Art Processors</a>.
<br/>
<br/>
<a href='https://codemagic.io/'>Code Magic</a> and <a href ='https://manichord.com/'>Manichord</a> for additional build minutes and support.
<br/>
<br/>
<a href='https://slack.com/'>Slack</a> for upgrading our workspace free of charge.
<br/>
<br/>
<a href='https://apple.com/'>Apple</a> and <a href='https://google.com/'>Google</a> for help with expedited app reviews and listings.
<br/>
<br/>
Those who have given helpful and timely advice, including Byron Teu.<br/>
  ''';
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
          Strings.acknowledegementsTitle,
          style: Styles.textH5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ..._cards.map((e) {
                if (e is HomeCard) {
                  return ReusableCard.fromData(
                    card: e,
                    height: 48,
                  );
                }
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                  child: Text(
                    e.toString(),
                    style: Styles.textH4,
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ReusableCardBase(
                  child: [
                    HtmlWidget(
                      _thanksHtml,
                      hyperlinkColor: Styles.textH5Hyperlink.color,
                      textStyle: Styles.textP,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
