import 'package:flutter/material.dart';
import 'package:SlTrade/widgets/Securitie.dart';

class MySecuritiesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Мои инструменты', style: TextStyle(fontSize: 20.0))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('Tiker'),
                    ),
                    Container(
                        width: 80.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('Bid'), Text('Ask')]))
                  ],
                )
              ],
            ),
          ),
          SecuritieWidget(
            tikerName: 'AXYI',
            fullName: 'Drugak',
            bid: '122',
            bidPercentage: 23,
            ask: '999',
            askPercentage: -12,
            fullVersion: false,
          )
        ],
      ),
    );
  }
}
