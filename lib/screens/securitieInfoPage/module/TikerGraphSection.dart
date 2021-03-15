import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class TikerGraphSection extends StatefulWidget {
  @override
  _TikerGraphSectionState createState() => _TikerGraphSectionState();
}

class _TikerGraphSectionState extends State<TikerGraphSection> {
  var data = [1.0, 2.1, 4.0, 4.5, 4.2, 3.5, 6.0, 5.8, 4.7, 2.0];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 33.0),
      height: 40,
      child: new Sparkline(
        lineColor: Color.fromRGBO(192, 205, 220, 1),
        lineWidth: 2,
        // fillMode: FillMode.below,p
        data: data,
      ),
    );
  }
}
