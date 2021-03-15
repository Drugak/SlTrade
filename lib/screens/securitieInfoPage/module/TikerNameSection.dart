import 'package:flutter/material.dart';
import 'package:SlTrade/screens/style/SecuritieInfoPageStyle.dart';

class TikerNameSection extends StatefulWidget {
  
  final tikerName;
  TikerNameSection({
    this.tikerName
  }) : super(key: ObjectKey(tikerName));


  @override
  _TikerNameSectionState createState() => _TikerNameSectionState();
}

class _TikerNameSectionState extends State<TikerNameSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /**
        * Tiker name section.
        */
        // Text(widget.tikerName['fullName'], style: fullSecureName),
        Text("Raifeisen bank", style: SecuritieInfoPageStyle.bigTextStyle),
        Text(widget.tikerName['shortName'], style: SecuritieInfoPageStyle.smallTextBlackStyle),
      ],
    );
  }
}