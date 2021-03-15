import 'package:flutter/material.dart';

abstract class MyTikerInfoStyle {
  static const TextStyle title = TextStyle(
    color: Color.fromRGBO(28,48,65,1),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto'
  );
  
  static const TextStyle valueTitle = TextStyle(
    color: Color.fromRGBO(123,142,168,1),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto'
  );

  static const TextStyle value = TextStyle(
    color: Color.fromRGBO(28,48,65,1),
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto'
  );

  static const TextStyle redValue = TextStyle(
    color: Color.fromRGBO(221,81,46,1),
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto'
  );
}