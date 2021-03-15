import 'package:flutter/material.dart';

abstract class SecuritieInfoPageStyle {
  static const TextStyle bigTextStyle = TextStyle(
      color: Color.fromRGBO(28, 48, 65, 1),
      fontSize: 32,
      fontWeight: FontWeight.w600); 

  static const TextStyle fullSecureName = TextStyle(
      color: Color.fromRGBO(28, 48, 65, 1),
      fontSize: 20,
      fontWeight: FontWeight.w600);
  static const TextStyle almostBigTextStyle = TextStyle(
      color: Color.fromRGBO(28, 48, 65, 1),
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static const TextStyle mediumTextStyle = TextStyle(
      color: Color.fromRGBO(50, 88, 119, 1),
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static const TextStyle mediumTextBlackStyle = TextStyle(
      color: Color.fromRGBO(28, 48, 65, 1),
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static const TextStyle smallTextStyle =
      TextStyle(color: Color.fromRGBO(123, 142, 168, 1), fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle smallTextBlackStyle = TextStyle(
      color: Color.fromRGBO(28, 48, 65, 1),
      fontSize: 12,
      fontWeight: FontWeight.w500);
}
