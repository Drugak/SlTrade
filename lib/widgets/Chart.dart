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

  @override
  Widget build(BuildContext context) {
    SecuritieHistoryBloc _bloc = SecuritieHistoryBloc(widget.tikerName);

    createChartDataSet(list) {
      List<double> prices = new List();
      list.forEach((m) => {prices.add(double.parse(m.price))});
      return prices;
    }

    getHistoryData(tikerName) {
      if (tikerName) {
        return _bloc.fetchSecuritieHistoryData(tikerName);
      } else {
        return Null;
      }
    }

    return RefreshIndicator(
      onRefresh: () => getHistoryData(widget.tikerName),
      child: StreamBuilder(
        stream: _bloc.securitieStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return Text(snapshot.data.message);
                break;
              case Status.COMPLETED:
                return Container(
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
                    data: createChartDataSet(snapshot.data.data),
                  ),
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
