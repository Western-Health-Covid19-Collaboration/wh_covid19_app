//import 'package:flutter/cupertino.dart';
//
//import 'question.dart';
//
//class QuestionBank {
//  List<Question> _questionbank = [
//    Question(
//        step: 'Step 1',
//        questionText: '',
//        bloodProduct: 'Is this an Obstetrics patient?',
//        ROTEMimage: 'images/obstetrics.png',
//        choice1: 'Yes',
//        choice2: 'No'),
//    Question(
//        step: 'Step 2',
//        questionText: '',
//        bloodProduct: 'Is Fibrinogen adequate?',
//        ROTEMimage: 'images/LowFIBTEMA5.png',
//        choice1: 'FIBTEM A5 <= 10mm?',
//        choice2: 'FIBTEM A5 > 10mm'),
//    Question(
//        step: 'Step 2',
//        questionText: '',
//        bloodProduct: 'Is Fibrinogen adequate?',
//        ROTEMimage: 'images/LowFIBTEMA5.png',
//        choice1: 'FIBTEM A5 <= 8mm?',
//        choice2: 'FIBTEM A5 > 8mm'),
//    Question(
//        step: '',
//        questionText:
//            'Request Fibrinogen Concentrate and request Cryoprecipitate, consider 1g TXA',
//        bloodProduct: 'Low Fibrinogen',
//        ROTEMimage: 'images/FCdosingguide.png',
//        choice1: 'Proceed',
//        choice2: ''),
//    Question(
//        step: '',
//        questionText: 'Request Cryoprecipitate, consider 1g TXA',
//        bloodProduct: 'Low Fibrinogen',
//        ROTEMimage: 'images/NormalFIBTEMA5.png',
//        choice1: 'Proceed',
//        choice2: ''),
//    Question(
//        step: 'Step 3',
//        questionText: '',
//        bloodProduct: 'Are Platelets adequate?',
//        ROTEMimage: 'images/LowEXTEMA5Platelets.png',
//        choice1: 'EXTEM A5 <= 35mm?',
//        choice2: 'EXTEM A5 > 35mm?'),
//    Question(
//        step: 'Step 3',
//        questionText: '',
//        bloodProduct: 'Are Platelets adequate?',
//        ROTEMimage: 'images/LowEXTEMA5Platelets.png',
//        choice1: 'EXTEM A5 <= 25mm?',
//        choice2: 'EXTEM A5 > 25mm?'),
//    Question(
//        step: '',
//        questionText: 'Consider giving Platelets 1 Adult dose',
//        bloodProduct: 'Low Platelets',
//        ROTEMimage: 'images/Normal.png',
//        choice1: 'Proceed',
//        choice2: ''),
//    Question(
//        step: 'Step 4',
//        questionText: '',
//        bloodProduct: 'Are Clotting Factors adequate?',
//        ROTEMimage: 'images/ProlongedCTEXTEMA5.png',
//        choice1: 'EXTEM CT > 140s',
//        choice2: 'EXTEM CT <= 140s'),
//    Question(
//        step: '',
//        questionText: 'Consider giving FFP 1-2 units + Fibrinogen as indicated',
//        bloodProduct: 'Low coagulation factors',
//        ROTEMimage: 'images/Normal.png',
//        choice1: 'Proceed',
//        choice2: ''),
//    Question(
//        step: 'Step 5',
//        questionText:
//            'Is EXTEM A5 < 35mm or FIBTEM A5 < 10s or FIBTEM CT > 600s?',
//        bloodProduct: 'Fibrinolysis - is TXA required?',
//        ROTEMimage: 'images/Hyperfibrinolysis.png',
//        choice1: 'Yes',
//        choice2: 'No'),
//    Question(
//        step: '',
//        questionText:
//            'Consider giving 1g TXA or further dose if patient blood loss > 1 blood volume',
//        bloodProduct: 'Tranexamic acid recommended',
//        ROTEMimage: 'images/Normal.png',
//        choice1: 'Proceed',
//        choice2: ''),
//    Question(
//        step: 'Completed interpretation',
//        questionText:
//            'Exclude Obstetric/Surgical cause and ensure physiological targets are met.',
//        bloodProduct: 'If ongoing bleeding Repeat ROTEM at ten minutes',
//        ROTEMimage: 'images/Normal.png',
//        choice1: 'Restart step-by-step guide',
//        choice2: '')
//  ];
//
//  String getstep() {
//    return _questionbank[_questionNumber].step;
//  }
//
//  String getbloodProduct() {
//    return _questionbank[_questionNumber].bloodProduct;
//  }
//
//  String getQuestion() {
//    return _questionbank[_questionNumber].questionText;
//  }
//
//  String getROTEMimage() {
//    return _questionbank[_questionNumber].ROTEMimage;
//  }
//
//  String getChoice1() {
//    return _questionbank[_questionNumber].choice1;
//  }
//
//  String getChoice2() {
//    return _questionbank[_questionNumber].choice2;
//  }
//
//  int _questionNumber = 0;
//
//  void nextQuestionNumber(int choiceNumber) {
//    if (choiceNumber == 1 && _questionNumber == 0) {
//      _questionNumber = 1;
//    } else if (choiceNumber == 2 && _questionNumber == 0) {
//      _questionNumber = 2;
//    } else if (choiceNumber == 1 && _questionNumber == 1) {
//      _questionNumber = 3;
//    } else if (choiceNumber == 2 && _questionNumber == 1) {
//      _questionNumber = 5;
//    } else if (choiceNumber == 1 && _questionNumber == 2) {
//      _questionNumber = 4;
//    } else if (choiceNumber == 2 && _questionNumber == 2) {
//      _questionNumber = 5;
//    } else if (choiceNumber == 1 && _questionNumber == 3) {
//      _questionNumber = 6;
//    } else if (choiceNumber == 1 && _questionNumber == 4) {
//      _questionNumber = 6;
//    } else if (choiceNumber == 1 && _questionNumber == 5) {
//      _questionNumber = 7;
//    } else if (choiceNumber == 2 && _questionNumber == 5) {
//      _questionNumber = 8;
//    } else if (choiceNumber == 1 && _questionNumber == 6) {
//      _questionNumber = 7;
//    } else if (choiceNumber == 2 && _questionNumber == 6) {
//      _questionNumber = 8;
//    } else if (choiceNumber == 1 && _questionNumber == 7) {
//      _questionNumber = 8;
//    } else if (choiceNumber == 1 && _questionNumber == 8) {
//      _questionNumber = 9;
//    } else if (choiceNumber == 2 && _questionNumber == 8) {
//      _questionNumber = 10;
//    } else if (choiceNumber == 1 && _questionNumber == 9) {
//      _questionNumber = 10;
//    } else if (choiceNumber == 1 && _questionNumber == 10) {
//      _questionNumber = 11;
//    } else if (choiceNumber == 2 && _questionNumber == 10) {
//      _questionNumber = 12;
//    } else if (choiceNumber == 1 && _questionNumber == 11) {
//      _questionNumber = 12;
//      //TODO insert a summary page of products advised to give, would require matrix for each product e.g. if choice number == 1 and q number = 0, fibrinogen recommended Y. This may be challenging.
//    } else if (_questionNumber == 12) {
//      restart();
//    }
//  }
//
//  void restart() {
//    _questionNumber = 0;
//  }
//
//  void previousQuestionNumber() {
//    if (_questionNumber > 0) {
//      _questionNumber = 0;
////    } else if (_questionNumber == 2) {
////      _questionNumber = 0;
////    } else if (_questionNumber == 3) {
////      _questionNumber = 1;
////    } else if (_questionNumber == 4) {
////      _questionNumber = 2;
////    } else if (_questionNumber == 5) {
////      _questionNumber = 0;
////    } else if (_questionNumber == 6) {
////      _questionNumber = 0;
////    } else if (_questionNumber == 7) {
////      _questionNumber = 0;
////    } else if (_questionNumber == 8) {
////      _questionNumber = 0;
////    } else if (_questionNumber == 9) {
////      _questionNumber = 8;
////    } else if (_questionNumber == 10) {
////      _questionNumber = 8;
////    } else if (_questionNumber == 11) {
////      _questionNumber = 10;
////    } else if (_questionNumber == 12) {
////      _questionNumber = 10;
//    }
//  }
//
////  void previousQuestionNumber() {
////    _questionNumber--;
////    print('Previous question called');
////  }
//
////  TODO: Make floatingactionbutton return to previous page, unless int _questionnumber = 0. Then ?return to homepage via navigator
////  void backButton(){
////    _question number - 1
////  }
//
//  bool buttonShouldBeVisible() {
//    if (_questionNumber == 0 ||
//        _questionNumber == 1 ||
//        _questionNumber == 2 ||
//        _questionNumber == 5 ||
//        _questionNumber == 6 ||
//        _questionNumber == 8 ||
//        _questionNumber == 10) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//
//  bool floatbuttonShouldBeVisible() {
//    if (_questionNumber > 0)
////        _questionNumber == 2 ||
////        _questionNumber == 3 ||
////        _questionNumber == 4 ||
////        _questionNumber == 5 ||
////        _questionNumber == 6 ||
////        _questionNumber == 7 ||
////        _questionNumber == 8 ||
////        _questionNumber == 9 ||
////        _questionNumber == 10 ||
////        _questionNumber == 11 ||
////        _questionNumber == 12) {
//    {
//      return true;
//    } else {
//      return false;
//    }
//  }
//}
