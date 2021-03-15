import 'package:flutter/material.dart';
import 'package:SlTrade/screens/style/SecuritieInfoPageStyle.dart';
import 'package:SlTrade/widgets/BidAskDelta.dart';

class TikerCostInfoSection extends StatefulWidget {
  final tikerCostInfo;
  TikerCostInfoSection({this.tikerCostInfo})
      : super(key: ObjectKey(tikerCostInfo));

  @override
  _TikerCostInfoSectionState createState() => _TikerCostInfoSectionState();
}

class _TikerCostInfoSectionState extends State<TikerCostInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text('Цена покупки',
                    style: SecuritieInfoPageStyle.smallTextStyle),
                Row(
                  children: <Widget>[
                    Text(widget.tikerCostInfo['bid'],
                        style: SecuritieInfoPageStyle.almostBigTextStyle),
                    Container(
                        margin: EdgeInsets.only(left: 5.0, top: 5.0),
                        child: BidAskDeltaWidget(
                            delta: widget.tikerCostInfo['bidPercentage']))
                  ],
                ),
              ]),
          
					/**
          * Ask info
          */
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Цена продажи',
                    style: SecuritieInfoPageStyle.smallTextStyle),
                Row(
                  children: <Widget>[
                    Text(widget.tikerCostInfo['ask'],
                        style: SecuritieInfoPageStyle.almostBigTextStyle),
                    Container(
                        margin: EdgeInsets.only(left: 5.0, top: 5.0),
                        child: BidAskDeltaWidget(
                            delta: widget.tikerCostInfo['askPercentage']))
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
