import 'package:flutter/cupertino.dart';
import 'package:visco_elastic_feb_app/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ContactsList extends StatelessWidget {
//  String contact;
//  String phoneNumber;
//  GestureDetector call;
  const ContactsList({this.contact, this.phoneNumber});

  final String contact;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: AutoSizeText(
                  '$contact',
                  style: kContactPageStyle,
                ),
              ),
              SizedBox(
                width: 45.0,
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText('Ext:', style: kContactPageStyle),
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '$phoneNumber',
                  style: kContactPageStyle,
                ),
              ),
//          Expanded(
//            flex: 1,
//            child: call,
//          ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget build(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.all(8.0),
    itemExtent: 106.0,
    children: <ContactsList>[
      ContactsList(
        contact: 'Blood Bank',
        phoneNumber: '51488',
      ),
      ContactsList(
        contact: 'JK Anaesthetist I/C',
        phoneNumber: '53128',
      ),
      ContactsList(
        contact: 'JK Theatre Nurse I/C',
        phoneNumber: '53023',
      ),
      ContactsList(
        contact: 'Sunshine Anaesthetist I/C',
        phoneNumber: '53021',
      ),
    ],
  );
}

//    );
//  }
//
//}
//
//class ContactNumbers{
//  List<Contacts> contactNumbers = [
//
//];
//}
