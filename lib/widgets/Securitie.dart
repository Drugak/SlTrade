import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:SlTrade/screens/SecuritieInfoPage.dart';

class SecuritieWidget extends StatelessWidget {
  SecuritieWidget({
    this.tikerName,
    this.fullName,
    this.bid,
    this.bidPercentage,
    this.ask,
    this.askPercentage,
    this.fullVersion,
  }) : super(key: ObjectKey(tikerName));

  String tikerName;
  final String fullName;
  final String bid;
  final double bidPercentage;
  final String ask;
  final double askPercentage;
  final bool fullVersion;

  @override
  Widget build(BuildContext context) {
    isPositive(value) {
      if (value == null)
        return TextStyle(fontSize: 12.0, color: Color.fromRGBO(50, 88, 119, 1));

      return value > 0
          ? TextStyle(fontSize: 12.0, color: Colors.green)
          : TextStyle(fontSize: 12.0, color: Colors.red);
    }

    final textBigStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(50, 88, 119, 1));
    final textSmallStyle =
        TextStyle(fontSize: 12.0, color: Color.fromRGBO(50, 88, 119, 1));
    var data = [1.0, 2.1, 4.0, 4.5, 4.2, 3.5, 6.0, 5.8, 4.7, 2.0];

    if (fullVersion) {
      return Text('большой виджет');
    } else {
      return GestureDetector(
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecuritieInfoPage()),
            );
          },
        child: Container(
          height: 56.0,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 80.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('$tikerName',
                        overflow: TextOverflow.ellipsis, style: textBigStyle),
                    Text('$fullName',
                        overflow: TextOverflow.ellipsis, style: textSmallStyle)
                  ],
                ),
              ),
              Container(
                width: 120,
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
                  // fillMode: FillMode.below,
                  data: data,
                ),
              ),
              Container(
                width: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(bid != null ? '$bid' : '-', style: textBigStyle,
                          overflow: TextOverflow.ellipsis),
                    Text(bidPercentage != null ? '$bidPercentage%' : '-',
                        style: isPositive(bidPercentage))
                  ],
                ),
              ),
              Container(
                width: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(ask != null ? '$ask' : '-',
                        overflow: TextOverflow.ellipsis, style: textBigStyle),
                    Text(askPercentage != null ? '$askPercentage%' : '-',
                        overflow: TextOverflow.ellipsis,
                        style: isPositive(askPercentage))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
