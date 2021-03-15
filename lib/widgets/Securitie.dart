import 'package:flutter/material.dart';
import 'package:SlTrade/screens/securitieInfoPage/index.dart';
import 'package:SlTrade/widgets/BidAskDelta.dart';
import 'package:SlTrade/widgets/Chart.dart';

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
    
    final textBigStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(50, 88, 119, 1));
    final textSmallStyle =
        TextStyle(fontSize: 12.0, color: Color.fromRGBO(50, 88, 119, 1));

    if (fullVersion) {
      return Text('большой виджет');
    } else {
      return GestureDetector(
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
                SecuritieInfoPage(secureInfo: {
                  'fullName':fullName,
                  'bid':bid,
                  'bidPercentage':bidPercentage,
                  'ask':ask,
                  'askPercentage':askPercentage,
                  'tikerName': tikerName
                  })),
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
              ChartWidget(tikerName: tikerName),
              Container(
                width: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(bid != null ? '$bid' : '-', style: textBigStyle,
                          overflow: TextOverflow.ellipsis),
                    BidAskDeltaWidget(delta:bidPercentage)
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
                    BidAskDeltaWidget(delta:askPercentage)
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
