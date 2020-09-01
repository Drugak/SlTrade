import 'package:flutter/material.dart';

//Pages
import 'package:SlTrade/screens/SecuritiesPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SecuritiesPage(),
      ),
    );
  }
}
