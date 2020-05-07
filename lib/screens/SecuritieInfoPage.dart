import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class SecuritieInfoPage extends StatefulWidget {
  @override
  _SecuritieInfoPageState createState() => _SecuritieInfoPageState();
}

class _SecuritieInfoPageState extends State<SecuritieInfoPage> {
  @override
  Widget build(BuildContext context) {
    var data = [1.0, 2.1, 4.0, 4.5, 4.2, 3.5, 6.0, 5.8, 4.7, 2.0];

    final bigTextStyle = TextStyle(
        color: Color.fromRGBO(50, 88, 119, 1),
        fontSize: 24,
        fontWeight: FontWeight.w600);
    final mediumTextStyle = TextStyle(
        color: Color.fromRGBO(50, 88, 119, 1),
        fontSize: 16,
        fontWeight: FontWeight.w500);
    final smallTextStyle =
        TextStyle(color: Color.fromRGBO(123, 142, 168, 1), fontSize: 12);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          child: Column(children: <Widget>[
            /**
         * Tiker name sectio.
         */
            Text('Raifeisen bank', style: bigTextStyle),
            Text('BAVL', style: smallTextStyle),
            /**
         * Tiker Info sectio.
         */
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /**
          * Bid info
          */
                Column(children: <Widget>[
                  Text('Bid', style: smallTextStyle),
                  Text('6.234', style: mediumTextStyle),
                  Text('+1,22%')
                ]),
                /**
           * Amount info
           */
                Column(
                  children: <Widget>[
                    Text(
                      '6,938 UAH',
                      style: bigTextStyle,
                    ),
                    Row(children: [
                      Text('+1,17 %', style: smallTextStyle),
                      Text('+0,018 UAH', style: smallTextStyle),
                    ]),
                    Text('17:00:00 Today', style: smallTextStyle)
                  ],
                ),
                /**
          * Ask info
          */
                Column(children: <Widget>[
                  Text('Ask', style: smallTextStyle),
                  Text('6.930', style: mediumTextStyle),
                  Text('+1,22%')
                ]),
              ],
            ),
            /**
       * Big graph section
       */
            Container(
              child: new Sparkline(
                lineColor: Colors.black,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment
                      .topCenter, // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xFAFAFAFA),
                    const Color(0xFFeeeeee)
                  ], // whitish to gray
                  tileMode:
                      TileMode.clamp, // repeats the gradient over the canvas
                ),
                lineWidth: 0.3,
                // fillMode: FillMode.below,p
                data: data,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(
                            color: Color.fromRGBO(50, 88, 119, 1), width: 2.0)),
                    onPressed: () => {print('hi flatbuton')},
                    child: Text(
                      'Sell',
                      style: mediumTextStyle,
                    ),
                  )),
                  Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                    color: Color.fromRGBO(50, 88, 119, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side:
                            BorderSide(color: Color.fromRGBO(50, 88, 119, 1))),
                    onPressed: () => {print('hi flatbuton')},
                    child: Text('Buy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )),
                ])
          ])),
    );
  }
}
