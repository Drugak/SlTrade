import 'package:flutter/material.dart';
import 'package:SlTrade/widgets/Securitie.dart';
import 'package:SlTrade/models/SecuritieModel.dart';

class AllSecuritiesWidget extends StatelessWidget {
  AllSecuritiesWidget({
    this.listOfSecuritie
  }) : super(key: ObjectKey(12));

  final SecuritieModel listOfSecuritie;

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
                    Text('Все инструменты', style: TextStyle(fontSize: 20.0))
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
              tikerName: listOfSecuritie.ticker,
              fullName: listOfSecuritie.issuername,
              bid: '6,938',
              bidPercentage: 1.22,
              ask: '6,938',
              askPercentage: -1.22,
              fullVersion: false,
            ),
            // SecuritieWidget(
            //   tikerName: 'BAVL',
            //   fullName: 'Raifwisen bank',
            //   bid: '122',
            //   bidPercentage: -3,
            //   ask: '999',
            //   askPercentage: -1,
            //   fullVersion: false,
            // ),
            // SecuritieWidget(
            //   tikerName: 'ENMZ',
            //   fullName: 'Full ticker name',
            //   bid: '6,938',
            //   bidPercentage: -1.23,
            //   ask: '6,938',
            //   fullVersion: false,
            // )
        ],
      ),
    );
  }
}
