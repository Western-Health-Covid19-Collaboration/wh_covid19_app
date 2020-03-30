import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wh_covid19/style.dart';

class ChecklistCheckbox extends StatelessWidget {
  final Function onChecked;
  final bool checked;

  /// the height and width of the checkbox (default: 24)
  final double dimensions;

  const ChecklistCheckbox(
      {@required this.checked, @required this.onChecked, this.dimensions = 24});

  @override
  Widget build(BuildContext context) {
    final checkIcon = SvgPicture.asset(
      'assets/images/icon/SVG/icon_checkmark.svg',
    );

    const borderRadius = BorderRadius.all(Radius.circular(8));

    final background =
        BoxDecoration(color: AppColors.grey600, borderRadius: borderRadius);

    return InkWell(
      onTap: () {
        onChecked();
      },
      child: Container(
        decoration: background,
        height: dimensions,
        width: dimensions,
        child: checked
            ? checkIcon
            : Container(
                foregroundDecoration: background,
              ),
      ),
    );
  }
}
