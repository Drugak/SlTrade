import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  build(context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // Use ShiftingTabBar instead of appBar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(54),
            child: new Container(
              height: 50.0,
              child: new TabBar(
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Заявки', style: TextStyle(color: Colors.black) )
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Мои заявки', style: TextStyle(color: Colors.black) )
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Сделки', style: TextStyle(color: Colors.black) )
                    ),
                  ),
                ],
              ),
            ),
          ),
            // Specify a color to background or it will pick it from primaryColor of your app ThemeData
            // color: Color.fromRGBO(236, 243, 248, 1),
            // You can change brightness manually to change text color style to dark and light or 
            // it will decide based on your background color
            // brightness: Brightness.dark,
          //   tabs: [
          //     // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
          //     ShiftingTab(
          //       icon: Icon(Icons.home),
          //       text: "Test 1",
          //     ),
          //     ShiftingTab(
          //       icon: Icon(Icons.directions_bike),
          //       text: "Test 2"
          //     ),
          //   ],
          // ),
          // Other parts of the app are exacly same as default TabBar widget
          body: TabBarView(
            children: [
                ListView(
                  children: <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  ],
                ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[Icon(Icons.home),],
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[Icon(Icons.home),],
              )
            ],
          ),
        ),
    );
  }
}
