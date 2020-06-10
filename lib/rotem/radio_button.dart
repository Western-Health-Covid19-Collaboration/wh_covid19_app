import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';

import 'data_classes_rotem.dart';

class RadioButtonLevel extends StatefulWidget {
  final level groupValue;
  final level value1;
  final level value2;
  final level value3;
  final String label1;
  final String label2;
  final String label3;
  final void Function(level selected) onChange;

  RadioButtonLevel(
      {this.groupValue,
      this.value1 = level.low,
      this.value2 = level.middle,
      this.value3 = level.high,
      this.label1,
      this.label2,
      this.label3,
      this.onChange});

  @override
  _RadioButtonLevelState createState() => _RadioButtonLevelState();
}

class _RadioButtonLevelState extends State<RadioButtonLevel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                activeColor: AppColors.purple900 ?? Colors.white,
                groupValue: widget.groupValue,
                value: widget.value1,
                onChanged: (level _value) {
                  widget.onChange(_value);
                }),
            Text('${widget.label1}', style: Styles.textBody)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                activeColor: AppColors.purple900 ?? Colors.white,
                groupValue: widget.groupValue,
                value: widget.value2,
                onChanged: (level _value) {
                  widget.onChange(_value);
                }),
            Text('${widget.label2}', style: Styles.textBody)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                activeColor: AppColors.purple900 ?? Colors.white,
                groupValue: widget.groupValue,
                value: widget.value3,
                onChanged: (level _value) {
                  widget.onChange(_value);
                }),
            Text('${widget.label3}', style: Styles.textBody)
          ],
        ),
      ],
    );
  }
}

//class RadioButtonYesNo extends StatefulWidget {
//  final bool groupValue;
//  final void Function(bool selected) onChange;
//  RadioButtonYesNo({this.groupValue, this.onChange});
//
//  @override
//  _RadioButtonYesNoState createState() => _RadioButtonYesNoState();
//}
//
//class _RadioButtonYesNoState extends State<RadioButtonYesNo> {
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//            Radio(
//                activeColor: kPurpleDark ?? kGreyText,
//                groupValue: widget.groupValue,
//                value: true,
//                onChanged: (_value) {
//                  widget.onChange(_value);
//                }),
//            Text('Yes', style: kSmaller)
//          ]),
//          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//            Radio(
//                activeColor: kPurpleDark ?? kGreyText,
//                groupValue: widget.groupValue,
//                value: false,
//                onChanged: (_value) {
//                  widget.onChange(_value);
//                }),
//            Text('No', style: kSmaller)
//          ])
//        ]);
//  }
//}
