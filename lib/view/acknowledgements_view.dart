import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../strings.dart';
import '../style.dart';
import '../widget/cards/reusable_card_base.dart';

class AcknowledgementsView extends StatelessWidget {
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
  static const _contributorsHtml = '''
<b>Gregg Miller</b> - Initial Development &amp; Ideas<br/>
<b>Matt Kelsh</b> - Design<br/>
<b>Marc Edwards</b> - Design<br/>
<b>Luke Sleeman</b> - Project Organiser<br/>
<b>Alessandro Favero</b> - Flutter Dev<br/>
<b>Maksim Lin</b> - Senior Flutter Dev, CI<br/>
<b>Mike Hughes</b> - Lead Flutter Dev, CI &amp; CD<br/>
<b>Adam Koch</b> - Flutter Dev<br/>
<b>Brett Morgan</b> - Flutter Dev<br/>
<b>Eric Jiang</b> - Flutter Dev<br/>
<b>Dylan Lange</b> - Flutter Dev<br/>
<b>Jonathan Galtieri</b> - Anaesthetist<br/>
<b>Ben Blackman</b> - Anaesthetic Registrar<br/>
<b>Fabien Dade</b> - ICU Registrar<br/>
<b>Alice Gynther</b> - Anaesthetist<br/>
<b>Kim Nguyen</b> - Flutter Dev<br/>
<b>Bramley Turner-Jones</b> - Flutter Dev<br/>
<b>Suesi Tran</b> - Flutter Dev<br/>
<b>June Chen</b> - Flutter Dev<br/>
<b>Joshua Case</b> - Flutter Dev<br/>
<b>Poornima Sivakumar</b> - Documentation<br/>
<b>Fabio</b> - Documentation<br/>
<b>Sally Chung</b> - Testing and General Support<br/>
<b>Carlos Melegrito</b> - Design<br/>
<b>Jinju Jang</b> - Design<br/>
<b>James Douglas</b> - Intensivist<br/>
<b>Josh Szental</b> - Anaesthetist<br/>
<b>Raffy Halim</b> - Anaesthetist
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
            children: const [
              HtmlSectionCard(title: 'Acknowledgements', html: _thanksHtml),
              HtmlSectionCard(title: 'Contributors', html: _contributorsHtml)
            ],
          ),
        ),
      ),
    );
  }
}

class HtmlSectionCard extends StatelessWidget {
  final String title;
  final String html;

  const HtmlSectionCard({@required this.title, @required this.html});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(4, 24, 16, 0),
          child: Text(
            title,
            style: Styles.textH4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: ReusableCardBase(
            child: [
              HtmlWidget(
                html,
                hyperlinkColor: Styles.textH5Hyperlink.color,
                textStyle: Styles.textP,
              )
            ],
          ),
        )
      ],
    );
  }
}
