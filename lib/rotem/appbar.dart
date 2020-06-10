//import 'package:flutter/material.dart';
//
//Widget CommonAppBar(
//    {BuildContext context,
//    String appBarTitle,
//    Color bgStart = kBackgroundColor,
//    Color bgEnd = kBackgroundColor}) {
//  bool whiteBar = true;
//  if (bgStart != kBackgroundColor || bgEnd != kBackgroundColor) {
//    whiteBar = false;
//  }
//  return GradientAppBar(
//      backgroundColorStart: bgStart,
//      backgroundColorEnd: bgEnd,
//      iconTheme: IconThemeData(color: whiteBar ? kGreyText : Colors.white),
//      title: AutoSizeText('$appBarTitle',
//          maxLines: 1,
//          minFontSize: 6,
//          style: whiteBar ? kAppBarText : kAppBarTextWhite),
//      actions: [
//        whiteBar
//            ? IconButton(
//                icon: Icon(Icons.home),
//                color: kGreyText,
//                onPressed: () =>
//                    Navigator.of(context).popUntil((route) => route.isFirst))
//            : SizedBox(width: 0),
//        IconButton(
//            icon: Icon(Icons.info_outline),
//            color: whiteBar ? kGreyText : Colors.white,
//            onPressed: () {
//              showAboutDialog(
//                  context: context,
//                  applicationName: 'Periop Guidelines app',
//                  applicationIcon: Column(
//                    children: <Widget>[
//                      SizedBox(height: 30),
//                      Image.asset('assets/W.jpg', width: 80),
//                    ],
//                  ),
//                  applicationVersion: appVersion,
//                  applicationLegalese: '\u00a9 2020 Josh Szental FANZCA',
//                  children: [
//                    Text(
//                        '\nDepartment of Anaesthesia, Pain & Perioperative Medicine\nWestern Health\nMelbourne, Australia\n\n',
//                        style: kXSmall),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        InkWell(
//                          child: Text('EMAIL FEEDBACK',
//                              style: kSmallerLink, textAlign: TextAlign.right),
//                          onTap: () => UrlUtils.sendEmail(
//                              'Joshua.Szental@wh.org.au',
//                              'Perioperative%20Guidelines%20app%20feedback',
//                              'Hi,%20here\'s%20some%20feedback%20for%20you%20about%20the%20Perioperative%20Guidelines%20app:'),
//                        ),
//                        InkWell(
//                            child: Text('CREDITS',
//                                style: kSmallerLink,
//                                textAlign: TextAlign.right),
//                            onTap: () => Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Credits()))),
//                      ],
//                    ),
//                    SizedBox(height: 30),
//                    Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          InkWell(
//                            child: Text('INTRANET',
//                                style: kSmallerLink,
//                                textAlign: TextAlign.right),
//                            onTap: () => UrlUtils.launchWithBrowser(
//                                'http://inside.wh.org.au/departmentsandservices/Anaesthetics/Pages/default.aspx'),
//                          ),
//                          InkWell(
//                            child: Text(
//                              'DISCLAIMER',
//                              style: kSmallerLink,
//                              textAlign: TextAlign.right,
//                            ),
//                            onTap: () => Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => DisclaimerView())),
//                          )
//                        ])
//                  ]);
//            })
//      ]);
//}
//
//class Credits extends StatelessWidget {
//  var titleSize = AutoSizeGroup();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//            backgroundColor: kBackgroundColor,
//            iconTheme: IconThemeData(color: kGreyText),
//            title: Text('Diabetes', style: kAppBarText)),
//        backgroundColor: kBackgroundColor,
//        body: SafeArea(
//            minimum: EdgeInsets.all(20),
//            child: SingleChildScrollView(
//              child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: [
//                    Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text('Perioperative', style: kMediumBold),
//                              Text('Guideline App', style: kMedium),
//                            ],
//                          ),
//                          Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              children: <Widget>[
//                                Image.asset('assets/W.jpg', width: 60),
//                                Text('Western Health', style: kWH)
//                              ]),
//                        ]),
//                    SizedBox(height: 15),
//                    Divider(thickness: 0.5, color: kGreyText),
//                    Center(
//                        child: Text('Credits',
//                            style: kMediumBold, textAlign: TextAlign.center)),
//                    Center(
//                        child: AutoSizeText(
//                            'for guideline creation and/or app testing',
//                            style: kSmallSemiBold,
//                            textAlign: TextAlign.center,
//                            maxLines: 1)),
//                    Divider(thickness: 0.5, color: kGreyText),
//                    SizedBox(height: 15),
//                    ListView.builder(
//                        physics: NeverScrollableScrollPhysics(),
//                        shrinkWrap: true,
//                        itemCount: creditsList.length,
//                        itemBuilder: (context, index) {
//                          return ListTile(
//                            leading: Icon(FontAwesomeIcons.star),
//                            title: AutoSizeText(creditsList[index].title,
//                                style: kSmallBold,
//                                group: titleSize,
//                                maxLines: 1),
//                            subtitle: Text(creditsList[index].subtitle,
//                                style: kXSmall),
//                          );
//                        }),
//                  ]),
//            )));
//  }
//
//  List<SelectableListNoIcon> creditsList = [
//    SelectableListNoIcon('Antiplatelets & Anticoagulants',
//        'Josh Szental, Georgia Preece, David Bramley, Omeed Albazzaz'),
//    SelectableListNoIcon('Diabetes Medications',
//        'Shane Hamblin & Endocrinology unit, Josh Szental, Nicole Sheridan, David Bramley'),
//    SelectableListNoIcon(
//        'ROTEM Interpretation', 'Gregg Miller, Georgie Imberger'),
//    SelectableListNoIcon('Pacemakers & ICDs', 'Ying Chen, Alice Gynther'),
//    SelectableListNoIcon(
//        'Stress Test Guideline', 'Josh Szental, Harry Marsh, Julie Chan'),
//    SelectableListNoIcon('Campus Suitability / OSA Guidelines',
//        'David Bramley, Josh Szental, Phil Johnson, Tjung Wai Wong'),
//    SelectableListNoIcon('General assistance',
//        'Simon Roberts, Rosalie Hill, Andrew Vuong, Alison Tse'),
//  ];
//}
