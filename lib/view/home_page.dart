import 'package:flutter/material.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/widget/card_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
            child: Text(
          'EGBA',
          style: TextStyle(color: Colors.black),
        )),
        //backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CardContainer(
                title: 'Staff Welfare & PPE',
                cards: staffWelfare,
              ),
              CardContainer(
                title: 'Intubations',
                cards: intubation,
              ),
              CardContainer(
                title: 'ICU Non-Intesivist',
                cards: icu,
              ),
              CardContainer(
                title: 'Additional Resources',
                cards: info,
              )
            ],
          ),
        ),
      ),
    );
  }
}
