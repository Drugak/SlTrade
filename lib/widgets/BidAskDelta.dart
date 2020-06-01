import 'package:flutter/material.dart';

class BidAskDeltaWidget extends StatelessWidget {

  BidAskDeltaWidget({
    this.delta
  }) : super(key: ObjectKey(delta));

  final double delta;

  @override
  Widget build(BuildContext context) {
    isPositive(value) {
      if (value == null)
        return TextStyle(fontSize: 12.0, color: Color.fromRGBO(50, 88, 119, 1));

      return value > 0
          ? TextStyle(fontSize: 12.0, color: Colors.green)
          : TextStyle(fontSize: 12.0, color: Colors.red);
    }

    return Text(delta != null ? '$delta%' : '-',
                        style: isPositive(delta));
  }
}