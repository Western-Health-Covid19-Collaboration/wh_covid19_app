import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ROTEMType { Obstetrics, General }
enum level { low, middle, high }

class ROTEMData extends ChangeNotifier {
  ROTEMType selectedPatientType = null;
  int FIBTEMA5 = 14;
  level EXTEMA5;
  level EXTEMCT;

  void setType(ROTEMType input) {
    selectedPatientType = input;
    notifyListeners();
  }

  void setFIBTEMA5(int input) {
    FIBTEMA5 = input;
    notifyListeners();
  }

  void setEXTEMA5(level input) {
    EXTEMA5 = input;
    notifyListeners();
  }

  void setEXTEMCT(level input) {
    EXTEMCT = input;
    notifyListeners();
  }

  bool get validate {
    if (selectedPatientType != null && EXTEMA5 != null && EXTEMCT != null) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    selectedPatientType = null;
    FIBTEMA5 = 14;
    EXTEMA5 = null;
    EXTEMCT = null;
  }
}
