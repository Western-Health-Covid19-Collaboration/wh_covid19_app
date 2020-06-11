import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../style.dart';

import 'advice_widget.dart';
import 'button.dart';

import 'data_classes_rotem.dart';

class ROTEMResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final type = Provider.of<ROTEMData>(context).selectedPatientType;
    final fibtemA5 = Provider.of<ROTEMData>(context).fibtemA5;
    final extemA5 = Provider.of<ROTEMData>(context).extemA5;
    final extemCT = Provider.of<ROTEMData>(context).extemCT;

    final List productsFib = <String>[];
    final List productsPlt = <String>[];
    final List productsFFP = <String>[];
    final List productsTXA = <String>[];

    if (type == ROTEMType.obstetrics) {
      if (fibtemA5 > 8 && fibtemA5 <= 10) {
        productsFib.add(
            '• 2g of Fibrinogen concentrate\n• Request cryoprecipitate (10-20 whole blood units, or 5-10 apheresis units)');
      }
      if (fibtemA5 > 6 && fibtemA5 <= 8) {
        productsFib.add(
            '• 3g of Fibrinogen concentrate\n• Request cryoprecipitate (10-20 whole blood units, or 5-10 apheresis units)');
      }
      if (fibtemA5 >= 4 && fibtemA5 <= 6) {
        productsFib.add(
            '• 4g of Fibrinogen concentrate\n• Request cryoprecipitate (20 whole blood units, or 10 apheresis units)');
      }
      if (fibtemA5 < 4) {
        productsFib.add(
            '• 5g of Fibrinogen concentrate\n• Request cryoprecipitate (20 whole blood units, or 10 apheresis units)');
      }
    }

    if (fibtemA5 < 9 && type == ROTEMType.general) {
      productsFib.add(
          '• Cryoprecipitate (10-20 whole blood units, or 5-10 apheresis units)');
    }

    if ((productsFib.isEmpty && extemA5 != level.high) ||
        (productsFib.isNotEmpty && extemA5 == level.low)) {
      productsPlt.add('• Platelets - one adult dose');
    }

    if ((type == ROTEMType.obstetrics &&
            extemCT != level.low &&
            fibtemA5 > 12) ||
        (type == ROTEMType.obstetrics &&
            extemCT == level.high &&
            fibtemA5 <= 12) ||
        (type == ROTEMType.general && extemCT != level.low && fibtemA5 > 8) ||
        (type == ROTEMType.general && extemCT == level.high && fibtemA5 <= 8)) {
      productsFFP
          .add('• FFP 1-2 units, or Prothrombinex 12.5 U/kg (to nearest 500U)');
    }

    // ignore: omit_local_variable_types
    final bool anyProduct = (productsFib.isNotEmpty ||
        productsPlt.isNotEmpty ||
        productsFFP.isNotEmpty);

    if (anyProduct) {
      productsTXA
          .add('• TXA 1g\n• Consider a repeat dose if EBL > 1 blood volume');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ROTEM Interpretation',
          style: Styles.textH5,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (anyProduct)
                const Text('Consider', style: Styles.textH1)
              else
                Text('No products currently indicated', style: Styles.textH1),
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
              if (anyProduct)
                Text(
                    '\nRepeat ROTEM 10 minutes after completion of each intervention to assess response',
                    style: Styles.textH3)
              else
                const SizedBox(height: 0),
              const SizedBox(height: 20),
              const Divider(),
              Text('General Measures', style: Styles.textH4),
              Text(
                  '• Exclude ${type == ROTEMType.obstetrics ? 'obstetric' : 'surgical'} cause for bleeding\n• Transfuse RBC to appropriate threshold\n• Avoid hypothermia, hypocalcaemia, acidosis',
                  style: Styles.textSemiBold),
              const SizedBox(height: 30),
              Button(
                colour: AppColors.purple500,
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
