import 'package:SlTrade/models/SecuritieModel.dart';
import 'package:flutter/material.dart';
import 'package:SlTrade/widgets/Securitie.dart';

class AllSecuritiesWidget extends StatelessWidget {
  AllSecuritiesWidget({this.listOfSecuritie}) : super(key: ObjectKey(12));

  final List<SecuritieModel> listOfSecuritie;

  @override
  Widget build(BuildContext context) {
    final colorTextStyle = TextStyle(color: Color.fromRGBO(50, 88, 119, 1));
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
                      Text('Все инструменты',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromRGBO(50, 88, 119, 1)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Tiker', style: colorTextStyle),
                      ),
                      Container(
                          width: 80.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Bid',
                                  style: colorTextStyle,
                                ),
                                Text(
                                  'Ask',
                                  style: colorTextStyle,
                                )
                              ]))
                    ],
                  )
                ],
              )),
              ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listOfSecuritie.length,
              itemBuilder: (context, index) {
                final item = listOfSecuritie[index];
                return SecuritieWidget(
                  tikerName: item.ticker,
                  fullName: item.issuername,
                  bid: item.bid,
                  bidPercentage: double.parse(item.biddelta),
                  ask: item.ask,
                  askPercentage: double.parse(item.askdelta),
                  fullVersion: false,
                );
              },
            ),
        ],
      ),
    );
  }
}
