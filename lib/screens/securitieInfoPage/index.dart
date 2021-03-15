import 'package:flutter/material.dart';

import 'package:SlTrade/widgets/CustomTapBar.dart';
import 'package:SlTrade/screens/style/SecuritieInfoPageStyle.dart';

//Components
import 'package:SlTrade/screens/securitieInfoPage/module/TikerNameSection.dart';
import 'package:SlTrade/screens/securitieInfoPage/module/TikerCostInfoSection.dart';
import 'package:SlTrade/screens/securitieInfoPage/module/TikerGraphSection.dart';
import 'package:SlTrade/screens/securitieInfoPage/module/MyTikerInfo.dart';

class SecuritieInfoPage extends StatefulWidget {
  final secureInfo;
  SecuritieInfoPage({this.secureInfo}) : super(key: ObjectKey(secureInfo));

  @override
  _SecuritieInfoPageState createState() => _SecuritieInfoPageState();
}

class _SecuritieInfoPageState extends State<SecuritieInfoPage> {
  @override
  Widget build(BuildContext context) {

    MaterialButton myButton = RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Color.fromRGBO(28, 48, 65, 1), width: 2.0)),
      onPressed: () => {print('hi flatbuton')},
      child: Text(
        'Купить',
        style: SecuritieInfoPageStyle.mediumTextBlackStyle,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 16.0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TikerNameSection(tikerName: {
                  'fullname': widget.secureInfo['fullName'],
                  'shortName': widget.secureInfo['tikerName']
                }),
                TikerCostInfoSection(tikerCostInfo: {
                  'bid': widget.secureInfo['bid'],
                  'bidPercentage': widget.secureInfo['bidPercentage'],
                  'ask': widget.secureInfo['ask'],
                  'askPercentage': widget.secureInfo['askPercentage']
                }),
                TikerGraphSection(),
                MyTikerInfo(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Expanded(child: myButton),
                      Expanded(child: myButton),
                    ]),
                Expanded(
                  child: CustomTabBar(),
                )
              ])),
    );
  }
}
