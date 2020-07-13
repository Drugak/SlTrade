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
    ExchangeTransactionBloc _blocAsk =
        ExchangeTransactionBloc(widget.tikerName, 'A');

    ExchangeTransactionBloc _blocBid =
        ExchangeTransactionBloc(widget.tikerName, 'B');

    return StreamBuilder(
        stream: _blocAsk.securitieStream,
        builder: (context, snapshot1) {
          return StreamBuilder(
              stream: _blocBid.securitieStream,
              builder: (context, snapshot2) {
                if (snapshot1.hasData) {
                  switch (snapshot1.data.status) {
                    case Status.COMPLETED:
                      return Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot1.data.data.length,
                            itemBuilder: (context, index) {
                              final item = snapshot1.data.data[index];
                              return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      height: 56,
                                      color: Colors.amberAccent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.qty),
                                          Text(item.pric)
                                        ],
                                      ),
                                    ))
                                  ]);
                            },
                          )),
                          Expanded(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot2.data.data.length,
                            itemBuilder: (context, index) {
                              final item = snapshot2.data.data[index];
                              return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      height: 56,
                                      color: Colors.amberAccent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.pric),
                                          Text(item.qty),
                                        ],
                                      ),
                                    ))
                                  ]);
                            },
                          ))
                        ],
                      );
                      break;
                    case Status.ERROR:
                      return Text('Error');
                      break;
                  }
                } else {
                  return Text('Что-то с ответом от сервера');
                }
              });
        });
  }
}
