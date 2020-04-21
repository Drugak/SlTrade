import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      child: new Sparkline(
              data: data,
            ),
    );
  }
}