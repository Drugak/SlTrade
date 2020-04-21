import 'package:flutter/material.dart';

//Pages
import 'package:SlTrade/screens/ListOfBrokers.dart';
import 'package:SlTrade/screens/ProfilePge.dart';
import 'package:SlTrade/screens/LoginPage.dart';
import 'package:SlTrade/screens/SecuritiesPage.dart';
import 'package:SlTrade/screens/ApplicationsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: ifLogin(),
    // );
    return Container(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box)),
                Tab(icon: Icon(Icons.devices)),
                Tab(icon: Icon(Icons.settings)),
                Tab(text: 'Главная'),
                Tab(text: 'Заявки')
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListOfBrokersPage(),
              ProfilePage(),
              LoginPage(),
              SecuritiesPage(),
              ApplicationsPage()
            ],
          ),
        ),
    ));
  }
}