import 'package:flutter/material.dart';

enum ROTEMType { obstetrics, general }
enum level { low, middle, high }

class ROTEMData extends ChangeNotifier {
  ROTEMType selectedPatientType;
  int fibtemA5 = 14;
  level extemA5;
  level extemCT;

  void setType(ROTEMType input) {
    selectedPatientType = input;
    notifyListeners();
  }

  void setFIBTEMA5(int input) {
    fibtemA5 = input;
    notifyListeners();
  }

  void setEXTEMA5(level input) {
    extemA5 = input;
    notifyListeners();
  }

  void setEXTEMCT(level input) {
    extemCT = input;
    notifyListeners();
  }

  bool get validate {
    if (selectedPatientType != null && extemA5 != null && extemCT != null) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    selectedPatientType = null;
    fibtemA5 = 14;
    extemA5 = null;
    extemCT = null;
  }
}
