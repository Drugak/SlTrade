import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

class CustomTabBar extends StatelessWidget {
  build(context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // Use ShiftingTabBar instead of appBar
          appBar: ShiftingTabBar(
            // Specify a color to background or it will pick it from primaryColor of your app ThemeData
            color: Colors.grey,
            // You can change brightness manually to change text color style to dark and light or 
            // it will decide based on your background color
            // brightness: Brightness.dark,
            tabs: [
              // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
              ShiftingTab(
                icon: Icon(Icons.home),
                text: "Test 1",
              ),
              ShiftingTab(
                icon: Icon(Icons.directions_bike),
                text: "Test 2"
              ),
            ],
          ),
          // Other parts of the app are exacly same as default TabBar widget
          body: TabBarView(
            children: [
                ListView(
                  children: <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  ],
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
