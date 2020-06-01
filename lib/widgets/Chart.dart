import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:SlTrade/BLOC/SecuritieHistory.dart';
import 'package:SlTrade/networking/Response.dart';


class ChartWidget extends StatefulWidget {
  final tikerName;
  ChartWidget({
    this.tikerName,
  }) : super(key: ObjectKey(tikerName));
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  var data = [1.0, 2.1, 4.0, 4.5, 4.2, 3.5, 6.0, 5.8, 4.7, 2.0];

  @override
  Widget build(BuildContext context) {
    SecuritieHistoryBloc _bloc = SecuritieHistoryBloc(widget.tikerName);


    return RefreshIndicator(
          onRefresh: () => _bloc.fetchSecuritieHistoryData(widget.tikerName),
          child: StreamBuilder(
            stream: _bloc.securitieStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    return Text(snapshot.data.message);
                    break;
                  case Status.COMPLETED:
                    return ListView(
                      children: <Widget>[
                          Container(
                            width: 120,
                            child: new Sparkline(
                              lineColor: Colors.black,
                              fillMode: FillMode.below,
                              fillGradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  const Color(0xFAFAFAFA),
                                  const Color(0xFFeeeeee)
                                ],
                                tileMode: TileMode.clamp,
                              ),
                              lineWidth: 0.3,
                              data: data,
                            ),
                          )
                        ]
                      );
                    break;
                  case Status.ERROR:
                    return Text('Error');
                    break;
                }
              } else {
                return Text('Что-то с ответом от сервера');
              }
            },
          ),
    );
  }
}