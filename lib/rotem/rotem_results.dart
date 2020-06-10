import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../style.dart';

import 'advice_widget.dart';
import 'button.dart';
import 'constants.dart';
import 'data_classes_rotem.dart';

class ROTEMResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final type = Provider.of<ROTEMData>(context).selectedPatientType;
    final FIBTEMA5 = Provider.of<ROTEMData>(context).FIBTEMA5;
    final level EXTEMA5 = Provider.of<ROTEMData>(context).EXTEMA5;
    final level EXTEMCT = Provider.of<ROTEMData>(context).EXTEMCT;

    final List productsFib = <String>[];
    final List productsPlt = <String>[];
    final List productsFFP = <String>[];
    final List productsTXA = <String>[];

    if (type == ROTEMType.Obstetrics) {
      if (FIBTEMA5 > 8 && FIBTEMA5 <= 10) {
        productsFib.add(
            '• 2g of Fibrinogen concentrate\n• Request cryoprecipitate (10-20 whole blood units, or 5-10 apheresis units)');
      }
      if (FIBTEMA5 > 6 && FIBTEMA5 <= 8) {
        productsFib.add(
            '• 3g of Fibrinogen concentrate\n• Request cryoprecipitate (10-20 whole blood units, or 5-10 apheresis units)');
      }
      if (FIBTEMA5 >= 4 && FIBTEMA5 <= 6) {
        productsFib.add(
            '• 4g of Fibrinogen concentrate\n• Request cryoprecipitate (20 whole blood units, or 10 apheresis units)');
      }
      if (FIBTEMA5 < 4) {
        productsFib.add(
            '• 5g of Fibrinogen concentrate\n• Request cryoprecipitate (20 whole blood units, or 10 apheresis units)');
      }
    }

    if (FIBTEMA5 < 9 && type == ROTEMType.General) {
      productsFib.add(
          '• Cryoprecipitate (10-20 whole blood units, or 5-10 apheresis units)');
    }

    if ((productsFib.isEmpty && EXTEMA5 != level.high) ||
        (productsFib.isNotEmpty && EXTEMA5 == level.low)) {
      productsPlt.add('• Platelets - one adult dose');
    }

    if ((type == ROTEMType.Obstetrics &&
            EXTEMCT != level.low &&
            FIBTEMA5 > 12) ||
        (type == ROTEMType.Obstetrics &&
            EXTEMCT == level.high &&
            FIBTEMA5 <= 12) ||
        (type == ROTEMType.General && EXTEMCT != level.low && FIBTEMA5 > 8) ||
        (type == ROTEMType.General && EXTEMCT == level.high && FIBTEMA5 <= 8)) {
      productsFFP
          .add('• FFP 1-2 units, or Prothrombinex 12.5 U/kg (to nearest 500U)');
    }

    bool anyProduct = (productsFib.isNotEmpty ||
        productsPlt.isNotEmpty ||
        productsFFP.isNotEmpty);

    if (anyProduct) {
      productsTXA
          .add('• TXA 1g\n• Consider a repeat dose if EBL > 1 blood volume');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ROTEM Interpretation'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              anyProduct
                  ? Text('Consider', style: kLargeBold)
                  : Text('No products currently indicated', style: kLargeBold),
              const SizedBox(height: 20),
              AdviceWidget(
                  title: 'Fibrinogen',
                  subtitle:
                      'Fibrinogen Concentrate (obstetrics only)\nor Cryoprecipitate',
                  list: productsFib),
              AdviceWidget(title: 'Platelets', subtitle: '', list: productsPlt),
              AdviceWidget(
                  title: 'Factors',
                  subtitle: 'FFP or Prothrombinex',
                  list: productsFFP),
              AdviceWidget(
                  title: 'Tranexamic Acid (TXA)',
                  subtitle: '',
                  list: productsTXA),
              anyProduct
                  ? Text(
                      '\nRepeat ROTEM 10 minutes after completion of each intervention to assess response',
                      style: Styles.textH4)
                  : const SizedBox(height: 0),
              SizedBox(height: 20),
              const Divider(),
              Text('General Measures', style: kSmallerBold),
              Text(
                  '• Exclude ${type == ROTEMType.Obstetrics ? 'obstetric' : 'surgical'} cause for bleeding\n• Transfuse RBC to appropriate threshold\n• Avoid hypothermia, hypocalcaemia, acidosis',
                  style: kSmaller),
              SizedBox(height: 30),
              Button(
                colour: kPurpleLight,
                buttonChild: AutoSizeText('Return to main menu',
                    style: Styles.textH4, maxLines: 1),
                onPress: () {
                  //reset choices
                  Provider.of<ROTEMData>(context, listen: false).reset();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
