import 'package:SlTrade/widgets/StockGlass/GlassItem.dart';
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
        stream: _blocBid.securitieStream,
        builder: (context, snapshot1) {
          var biger1 = snapshot1.data.data.first.pric;
          return StreamBuilder(
              stream: _blocAsk.securitieStream,
              builder: (context, snapshot2) {
                var biger2 = snapshot2.data.data.last.pric;
                if (snapshot1.hasData && snapshot2.hasData) {
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
                              return GlassItem(item: item, biger: biger1);
                            },
                          )),
                          Expanded(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot2.data.data.length,
                            itemBuilder: (context, index) {
                              final item = snapshot2.data.data[index];
                              return GlassItem(item: item, biger: biger2);
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
