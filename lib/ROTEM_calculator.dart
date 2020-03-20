//import 'package:flutter/material.dart';
//import 'dart:math';
//import 'ROTEMFastInterpretation.dart';
//
//class ROTEMCalc {
//  ROTEMCalc({
//    this.selectedPatientType,
//    this.FIBTEMA5,
//    this.EXTEMA5,
//    this.EXTEMCT,
//    this.TXA,
//  });
//
//  final PatientType selectedPatientType;
//  final int FIBTEMA5;
//  final String EXTEMA5;
//  final String EXTEMCT;
//  final String TXA;
//
//  String actionFIBTEMA5() {
//    if (FIBTEMA5 > 10 && selectedPatientType == PatientType.Obstetrics) {
//      return ' Fibrinogen not currently indicated';
//    } else if (FIBTEMA5 > 8 && selectedPatientType == PatientType.Obstetrics) {
//      return '2g of Fibrinogen concentrate and request cryoprecipitate';
//    } else if (FIBTEMA5 > 6 && selectedPatientType == PatientType.Obstetrics) {
//      return '3g of Fibrinogen concentrate and request cryoprecipitate';
//    } else if (FIBTEMA5 >= 4 && selectedPatientType == PatientType.Obstetrics) {
//      return '4g of Fibrinogen concentrate and request cryoprecipitate';
//    } else if (FIBTEMA5 < 4 && selectedPatientType == PatientType.Obstetrics) {
//      return '5g of Fibrinogen concentrate and request cryoprecipitate';
//    } else if (FIBTEMA5 >= 9 && selectedPatientType == PatientType.General) {
//      return 'Fibrinogen not currently indicated';
//    } else if (FIBTEMA5 < 9 && selectedPatientType == PatientType.General) {
//      return 'Request cryoprecipitate and consider tranexamic acid 1g';
//    } else if (FIBTEMA5 >= 0 && selectedPatientType == PatientType.noEntry) {
//      return 'PLEASE RETURN TO PREVIOUS PAGE AND SELECT PATIENT TYPE';
//    }
//  }
//
//  Icon defineIconFibTemA5() {
//    if (FIBTEMA5 > 10 && selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.green, size: 40.0);
//    } else if (FIBTEMA5 <= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (FIBTEMA5 > 8 && selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.green, size: 40.0);
//    } else if (FIBTEMA5 <= 8 && selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (FIBTEMA5 >= 0 && selectedPatientType == PatientType.noEntry) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    }
//  }
//
//  String actionEXTEMA5() {
//    if (EXTEMA5 == '  >35mm') {
//      return ' Platelets not currently indicated';
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 >= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return 'Consider one adult dose of platelets';
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 < 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return 'Treat fibrinogen first and then repeat ROTEM';
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 >= 8 &&
//        selectedPatientType == PatientType.General) {
//      return 'Consider one adult dose of platelets';
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 < 8 &&
//        selectedPatientType == PatientType.General) {
//      return 'Treat fibrinogen first and then repeat ROTEM';
//    } else if (EXTEMA5 == '<25mm  ') {
//      return 'Give one adult dose of platelets';
//    } else if (EXTEMA5 == 'null') {
//      return 'PLEASE RETURN TO PREVIOUS PAGE AND COMPLETE STEP 3';
//    } else if (EXTEMA5 == '25-35mm' ||
//        EXTEMA5 == '<25mm  ' && selectedPatientType == PatientType.noEntry) {
//      return 'PLEASE RETURN TO PREVIOUS PAGE AND SELECT PATIENT TYPE';
//    }
//  }
//
//  Icon defineIconEXTEMA5() {
//    if (EXTEMA5 == '  >35mm') {
//      return Icon(Icons.brightness_1, color: Colors.green, size: 40.0);
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 >= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 < 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 >= 8 &&
//        selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMA5 == '25-35mm' &&
//        FIBTEMA5 < 8 &&
//        selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (EXTEMA5 == '<25mm  ') {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMA5 == 'null') {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (selectedPatientType == PatientType.noEntry) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    }
//  }
//
//  String actionEXTEMCT() {
//    if (EXTEMCT == '<80s  ') {
//      return 'FFP not currently indicated';
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 <= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return 'Correct fibrinogen and consider FFP or Prothrombinex';
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 > 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return 'Give FFP or Prothrombinex';
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 > 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return 'Give FFP or Prothrombinex';
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 <= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return 'Treat with Fibrinogen AND FFP or Prothrombinex';
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 <= 8 &&
//        selectedPatientType == PatientType.General) {
//      return 'Correct fibrinogen and consider FFP or Prothrombinex';
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 > 8 &&
//        selectedPatientType == PatientType.General) {
//      return 'Give FFP or Prothrombinex';
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 > 8 &&
//        selectedPatientType == PatientType.General) {
//      return 'Give FFP or Prothrombinex';
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 <= 8 &&
//        selectedPatientType == PatientType.General) {
//      return 'Treat with Fibrinogen AND FFP or Prothrombinex';
//    } else if (EXTEMCT == 'null') {
//      return 'PLEASE RETURN TO PREVIOUS PAGE AND COMPLETE STEP 4';
//    } else if (selectedPatientType == PatientType.noEntry) {
//      return 'PLEASE RETURN TO PREVIOUS PAGE AND SELECT PATIENT TYPE';
//    }
//  }
//
//  Icon defineIconEXTEMCT() {
//    if (EXTEMCT == '<80s  ') {
//      return Icon(Icons.brightness_1, color: Colors.green, size: 40.0);
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 <= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 > 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 > 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 <= 10 &&
//        selectedPatientType == PatientType.Obstetrics) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 <= 8 &&
//        selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (EXTEMCT == '80-140s' &&
//        FIBTEMA5 > 8 &&
//        selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 > 8 &&
//        selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMCT == '  >140s' &&
//        FIBTEMA5 <= 8 &&
//        selectedPatientType == PatientType.General) {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (EXTEMCT == 'null') {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    } else if (selectedPatientType == PatientType.noEntry) {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    }
//  }
//
//  String actionTXA() {
//    if (TXA == "Yes") {
//      return 'Give Tranexamic Acid 1g';
//    } else if (TXA == "No") {
//      return 'Consider requirement for TXA';
////    } else if (TXA == 'Unsure') {
////      return 'Consider Risk/benefit of TXA administration';
//    } else if (TXA == "  TXA given") {
//      return 'Consider repeat dose if EBL > 1 blood volume';
//    } else if (TXA == 'null') {
//      return 'RETURN TO PREVIOUS PAGE AND COMPLETE STEP 5';
//    }
//  }
//
//  Icon defineIconTXA() {
//    if (TXA == "Yes") {
//      return Icon(Icons.brightness_1, color: Colors.red, size: 40.0);
//    } else if (TXA == "No") {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
////    } else if (TXA == 'Unsure') {
////      return Icon(Icons.error_outline, color: Colors.red, size: 40.0);
//    } else if (TXA == "  TXA given") {
//      return Icon(Icons.brightness_1, color: Colors.green, size: 40.0);
//    } else if (TXA == 'null') {
//      return Icon(Icons.brightness_1, color: Colors.yellow, size: 40.0);
//    }
//  }
//}
//
////import 'package:flutter/material.dart';
////import 'dart:math';
////import 'ROTEMFastInterpretation.dart';
////
////enum PatientType {
////  Obstetrics,
////  General,
////}
////
////class ROTEMCalc {
////  ROTEMCalc({
////    this.selectedPatientType,
////    this.FIBTEMA5,
////    this.EXTEMA5,
////    this.EXTEMCT,
////    this.TXA,
////  });
////
////  final PatientType selectedPatientType;
////  final int FIBTEMA5;
////  final String EXTEMA5;
////  final String EXTEMCT;
////  final String TXA;
//////
////  String actionFIBTEMA5() {
////    if (FIBTEMA5 > 10 && selectedPatientType == PatientType.Obstetrics) {
////      return ' Fibrinogen currently normal, no fibrinogen required';
////    } else if (FIBTEMA5 > 8 && selectedPatientType == PatientType.Obstetrics) {
////      return '2g of Fibrinogen concentrate and request cryoprecipitate';
////    } else if (FIBTEMA5 > 6 && selectedPatientType == PatientType.Obstetrics) {
////      return '3g of Fibrinogen concentrate and request cryoprecipitate';
////    } else if (FIBTEMA5 >= 4 && selectedPatientType == PatientType.Obstetrics) {
////      return '4g of Fibrinogen concentrate and request cryoprecipitate';
////    } else if (FIBTEMA5 < 4 && selectedPatientType == PatientType.Obstetrics) {
////      return '5g of Fibrinogen concentrate and request cryoprecipitate';
////    } else if (FIBTEMA5 >= 9 && selectedPatientType == PatientType.General) {
////      return 'Fibrinogen currently normal, no fibrinogen required';
////    } else if (FIBTEMA5 < 9 && selectedPatientType == PatientType.General) {
////      return 'Request cryoprecipitate and consider tranexamic acid 1g';
////    }
////  }
////
////  Icon defineIconFibTemA5() {
////    if (FIBTEMA5 > 10) {
////      return Icon(Icons.check, color: Colors.green, size: 40.0);
////    } else if (FIBTEMA5 <= 10) {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    }
////  }
////
////  String actionEXTEMA5() {
////    if (EXTEMA5 == '  >35mm') {
////      return ' Platelets normal, no action required';
////    } else if (EXTEMA5 == '25-35mm' && FIBTEMA5 >= 10) {
////      return 'Consider one adult dose of platelets (correlate with platelet count)';
////    } else if (EXTEMA5 == '25-35mm' && FIBTEMA5 < 10) {
////      return 'Treat fibrinogen first and then repeat ROTEM';
////    } else if (EXTEMA5 == '<25mm  ') {
////      return 'Consider one adult dose of platelets (correlate with platelet count)';
////    } else if (EXTEMA5 == 'null') {
////      return 'PLEASE RETURN TO PREVIOUS PAGE AND COMPLETE STEP 3';
////    }
////  }
////
////  Icon defineIconEXTEMA5() {
////    if (EXTEMA5 == '  >35mm') {
////      return Icon(Icons.check, color: Colors.green, size: 40.0);
////    } else if (EXTEMA5 == '25-35mm' && FIBTEMA5 >= 10) {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    } else if (EXTEMA5 == '25-35mm' && FIBTEMA5 < 10) {
////      return Icon(Icons.error_outline, color: Colors.red, size: 40.0);
////    } else if (EXTEMA5 == '<25mm  ') {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    } else if (EXTEMA5 == 'null') {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    }
////  }
////
////  String actionEXTEMCT() {
////    if (EXTEMCT == '<80s  ') {
////      return ' Coagulation factors normal. No FFP required';
////    } else if (EXTEMCT == '80-140s' && FIBTEMA5 <= 10) {
////      return 'Correct fibrinogen and reassess';
////    } else if (EXTEMCT == '80-140s' && FIBTEMA5 > 10) {
////      return 'Low coagulation factors, consider FFP or Prothrombinex';
////    } else if (EXTEMCT == '  >140s' && FIBTEMA5 > 10) {
////      return 'Low coagulation factors, treat with FFP or Prothrombinex';
////    } else if (EXTEMCT == '  >140s' && FIBTEMA5 <= 10) {
////      return 'Low factors and Fibrinogen, treat with Fibrinogen AND FFP or Prothrombinex';
////    } else if (EXTEMCT == 'null') {
////      return 'PLEASE RETURN TO PREVIOUS PAGE AND COMPLETE STEP 4';
////    }
////  }
////
////  Icon defineIconEXTEMCT() {
////    if (EXTEMCT == '<80s  ') {
////      return Icon(Icons.check, color: Colors.green, size: 40.0);
////    } else if (EXTEMCT == '80-140s' && FIBTEMA5 <= 10) {
////      return Icon(Icons.error_outline, color: Colors.red, size: 40.0);
////    } else if (EXTEMCT == '80-140s' && FIBTEMA5 > 10) {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    } else if (EXTEMCT == '  >140s' && FIBTEMA5 > 10) {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    } else if (EXTEMCT == '  >140s' && FIBTEMA5 <= 10) {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    } else if (EXTEMCT == 'null') {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    }
////  }
////
////  String actionTXA() {
////    if (TXA == "Yes") {
////      return 'Tranexamic Acid 1g';
////    } else if (TXA == "No") {
////      return 'discuss with surgeons requirement for TXA';
////    } else if (TXA == 'Unsure') {
////      return 'Consider Risk/benefit of TXA administraiton';
////    } else if (TXA == "  TXA given") {
////      return 'Consider repeat dose if has lost over 1 blood volume';
////    } else if (TXA == 'null') {
////      return 'RETURN TO PREVIOUS PAGE AND COMPLETE STEP 5';
////    }
////  }
////
////  Icon defineIconTXA() {
////    if (TXA == "Yes") {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    } else if (TXA == "No") {
////      return Icon(Icons.error_outline, color: Colors.red, size: 40.0);
////    } else if (TXA == 'Unsure') {
////      return Icon(Icons.error_outline, color: Colors.red, size: 40.0);
////    } else if (TXA == "  TXA given") {
////      return Icon(Icons.check, color: Colors.green, size: 40.0);
////    } else if (TXA == 'null') {
////      return Icon(Icons.error, color: Colors.red, size: 40.0);
////    }
////  }
////}
