import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import '../routes.dart';
import '../style.dart';
import 'data_classes_rotem.dart';
import 'radio_button.dart';
import 'rotem_card.dart';
import 'rotem_results.dart';
import 'rotem_slider.dart';

class ROTEMInput extends StatefulWidget {
  @override
  _ROTEMInputState createState() => _ROTEMInputState();
}

class _ROTEMInputState extends State<ROTEMInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ROTEMData>(builder: (context, rotem, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ROTEM'),
          backgroundColor: AppColors.backgroundBlue,
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icon/SVG/icon_infographic.svg',
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.rotemInfographicTitle),
            )
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Complete at 5 minutes',
                  style: Styles.textH2,
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RotemCard(
                        text: 'Obstetrics',
                        icon: Icons.pregnant_woman,
                        iconSize: 58,
                        colour:
                            rotem.selectedPatientType == ROTEMType.obstetrics
                                ? AppColors.purple500
                                : AppColors.purple500.withAlpha(100),
                        iconColour:
                            rotem.selectedPatientType == ROTEMType.obstetrics
                                ? AppColors.purple50
                                : AppColors.purple50.withAlpha(100),
                        highlight:
                            rotem.selectedPatientType == ROTEMType.obstetrics,
                        onPress: () {
                          Provider.of<ROTEMData>(context, listen: false);
                          rotem.setType(ROTEMType.obstetrics);
                        },
                      ),
                    ),
                    Expanded(
                      child: RotemCard(
                        text: 'General / Trauma',
                        icon: Icons.local_hospital,
                        iconSize: 58,
                        colour: rotem.selectedPatientType == ROTEMType.general
                            ? AppColors.green800
                            : AppColors.green50.withAlpha(100),
                        iconColour:
                            rotem.selectedPatientType == ROTEMType.general
                                ? AppColors.grey50
                                : AppColors.grey500.withAlpha(100),
                        highlight:
                            rotem.selectedPatientType == ROTEMType.general,
                        onPress: () {
                          Provider.of<ROTEMData>(context, listen: false);
                          rotem.setType(ROTEMType.general);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text('FIBTEM A5', style: Styles.textH3),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          rotem.fibtemA5 == 15
                              ? '> 15'
                              : rotem.fibtemA5.toString(),
                          style: Styles.textH4),
                      const Text('mm', style: Styles.textH4)
                    ]),
                SliderTheme(
                  data: rotemSlider,
                  child: Slider(
                    value: rotem.fibtemA5.toDouble(),
                    min: 0,
                    max: 15,
                    onChanged: (double _newValue) {
                      rotem.setFIBTEMA5(_newValue.round());
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text('EXTEM A5', style: Styles.textH3),
                RadioButtonLevel(
                    groupValue: rotem.extemA5,
                    label1: '< 25 mm',
                    label2: '25-35 mm',
                    label3: '> 35 mm',
                    onChange: (level _value) {
                      Provider.of<ROTEMData>(context, listen: false)
                          .setEXTEMA5(_value);
                    }),
                const SizedBox(height: 20),
                const Text('EXTEM CT', style: Styles.textH3),
                RadioButtonLevel(
                    groupValue: rotem.extemCT,
                    label1: '< 80 s',
                    label2: '80-140 s',
                    label3: '> 140 s',
                    onChange: (level _value) {
                      Provider.of<ROTEMData>(context, listen: false)
                          .setEXTEMCT(_value);
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: Visibility(
          visible: rotem.validate,
          child: FloatingActionButton(
            backgroundColor: AppColors.purple500,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<ROTEMResults>(
                      builder: (context) => ROTEMResults()));
            },
            child: Icon(Icons.arrow_forward),
          ),
        ),
      );
    });
  }
}
