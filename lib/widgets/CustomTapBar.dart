import 'package:flutter/material.dart';
import 'package:SlTrade/widgets/StockGlass/index.dart';

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
          body: TabBarView(
            children: [
                // ListView(
                //   children: <Widget>[
                    
                //   ],
                // ),
              StockGlass(tikerName: 'USDQ'),
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
