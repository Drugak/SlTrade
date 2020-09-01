import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:SlTrade/widgets/CustomTapBar.dart';
import 'package:SlTrade/widgets/BidAskDelta.dart';

class SecuritieInfoPage extends StatefulWidget {
  final secureInfo;
  SecuritieInfoPage({this.secureInfo}) : super(key: ObjectKey(secureInfo));

  @override
  _SecuritieInfoPageState createState() => _SecuritieInfoPageState();
}

class _SecuritieInfoPageState extends State<SecuritieInfoPage> {
  @override
  Widget build(BuildContext context) {
    var data = [1.0, 2.1, 4.0, 4.5, 4.2, 3.5, 6.0, 5.8, 4.7, 2.0];

    final bigTextStyle = TextStyle(
        color: Color.fromRGBO(28, 48, 65, 1),
        fontSize: 32,
        fontWeight: FontWeight.w600);
    final almostBigTextStyle = TextStyle(
        color: Color.fromRGBO(28, 48, 65, 1),
        fontSize: 24,
        fontWeight: FontWeight.bold);
    final mediumTextStyle = TextStyle(
        color: Color.fromRGBO(50, 88, 119, 1),
        fontSize: 16,
        fontWeight: FontWeight.w500);
    final mediumTextBlackStyle = TextStyle(
        color: Color.fromRGBO(28, 48, 65, 1),
        fontSize: 16,
        fontWeight: FontWeight.w500);
    final smallTextStyle =
        TextStyle(color: Color.fromRGBO(123, 142, 168, 1), fontSize: 12);
    final smallTextBlackStyle = TextStyle(
        color: Color.fromRGBO(28, 48, 65, 1),
        fontSize: 12,
        fontWeight: FontWeight.w500);

    MaterialButton myButton = RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Color.fromRGBO(28, 48, 65, 1), width: 2.0)),
      onPressed: () => {print('hi flatbuton')},
      child: Text(
        'Купить',
        style: mediumTextBlackStyle,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            /**
         * Tiker name sectio.
         */
            Text(widget.secureInfo['fullName'], style: bigTextStyle),
            Text(widget.secureInfo['tikerName'], style: smallTextBlackStyle),
            /**
         * Tiker Info sectio.
         */
            Container(
              margin: EdgeInsets.only(top: 16.0, bottom: 40.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /**
          * Bid info
          */
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Цена покупки', style: smallTextStyle),
                        Row(
                          children: <Widget>[
                            Text(widget.secureInfo['bid'],
                                style: almostBigTextStyle),
                            Container(
                                margin: EdgeInsets.only(left: 5.0, top: 5.0),
                                child: BidAskDeltaWidget(
                                    delta: widget.secureInfo['bidPercentage']))
                          ],
                        ),
                      ]),
                  /**
          * Ask info
          */
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Цена продажи', style: smallTextStyle),
                        Row(
                          children: <Widget>[
                            Text(widget.secureInfo['ask'],
                                style: almostBigTextStyle),
                            Container(
                                margin: EdgeInsets.only(left: 5.0, top: 5.0),
                                child: BidAskDeltaWidget(
                                    delta: widget.secureInfo['askPercentage']))
                          ],
                        ),
                      ]),
                ],
              ),
            ),
            /**
       * Big graph section
       */
            Container(
              margin: EdgeInsets.only(bottom: 33.0),
              height: 40,
              child: new Sparkline(
                lineColor: Color.fromRGBO(192, 205, 220, 1),
                lineWidth: 2,
                // fillMode: FillMode.below,p
                data: data,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Expanded(child: myButton),
                  Expanded(child: myButton),
                ]),
            Expanded(
              child: CustomTabBar(),
            )
          ])),
    );
  }
}
