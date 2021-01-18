import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Pages
import 'package:SlTrade/screens/HomePage.dart';
import 'package:SlTrade/screens/LoginPage.dart';
import 'package:SlTrade/screens/TradingPage.dart';
import 'package:SlTrade/screens/SecuritieInfoPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'SlTrade',
    home: HomePage(),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => LoginPage(),
      '/tranding': (BuildContext context) => TrandingPage(),
      '/securitie-page': (BuildContext context) => SecuritieInfoPage(),
    },
  ));
}
