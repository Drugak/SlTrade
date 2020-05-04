import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Pages
import 'package:SlTrade/screens/HomePage.dart';
import 'package:SlTrade/screens/LoginPage.dart';
import 'package:SlTrade/screens/ProfilePge.dart';
import 'package:SlTrade/screens/TradingPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'SlTrade',
    home: HomePage(),
    routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => LoginPage(),
      '/profile': (BuildContext context) => ProfilePage(),
      '/tranding': (BuildContext context) => TrandingPage(),
    },
  ));
}
