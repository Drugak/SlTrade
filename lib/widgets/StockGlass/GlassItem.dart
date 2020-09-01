import 'package:flutter/material.dart';

class GlassItem extends StatelessWidget {
  GlassItem({this.item, this.biger}) : super(key: ObjectKey(12));

  final item;
  final biger;

  @override
  Widget build(BuildContext context) {
    final colorItem = item.typ == 'A'
        ? Color.fromRGBO(231, 252, 230, 1)
        : Color.fromRGBO(255, 230, 224, 1);

    var prosentBid =
        ((double.parse(item.pric) * 100) / double.parse(biger)) / 100;

    var prosentAsk = ((double.parse(item.pric) / double.parse(biger)) * 100);

    var gradientBid = LinearGradient(
      end: Alignment.centerRight,
      begin: Alignment.centerLeft,
      colors: [const Color(0xFFF), colorItem],
      stops: [prosentBid.toDouble(), 0.0],
      tileMode: TileMode.repeated,
    );

    var gradientAsk = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [const Color(0xFFF), colorItem],
      stops: [prosentAsk.toDouble(), 0.0],
      tileMode: TileMode.repeated,
    );

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                gradient: item.typ == 'A' ? gradientAsk : gradientBid),
            margin: EdgeInsets.only(right: 5),
            height: 56,
            // color: Colors.amberAccent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: item.typ == 'A'
                  ? [Text(biger)]
                  : [Text(item.qty), Text(item.pric)],
            ),
          ))
        ]);
  }
}
