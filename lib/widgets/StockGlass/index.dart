import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/BLOC/ExchangeTransactionBloc.dart';

class StockGlass extends StatefulWidget {
  final tikerName;
  StockGlass({
    this.tikerName,
  }) : super(key: ObjectKey(tikerName));
  @override
  _StockGlassState createState() => _StockGlassState();
}

class _StockGlassState extends State<StockGlass> {
  @override
  Widget build(BuildContext context) {
    ExchangeTransactionBloc _bloc =
        ExchangeTransactionBloc(widget.tikerName, 'A');

    return Column(
      children: [
        StreamBuilder(
            stream: _bloc.securitieStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.COMPLETED:
                    return Expanded(
                        child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data.data[index];
                        return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 5),
                                  height: 56,
                                  color: Colors.amberAccent,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [Text(item.qty), Text(item.pric)],
                                  ))
                            ]);
                      },
                    ));
                    break;
                  case Status.ERROR:
                    return Text('Error');
                    break;
                }
              } else {
                return Text('Что-то с ответом от сервера');
              }
            })
      ],
    );
  }
}
