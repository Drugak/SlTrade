import 'package:flutter/material.dart';

class RialtoStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime time = new DateTime.now();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ukrainian stock', style: TextStyle(fontSize: 20.0)),
              Text('$time', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('1420,00',style: TextStyle(fontSize: 20.0)),
              Text('+1.17%', style: TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
