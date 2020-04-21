import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Поиск',
          ),
        ),
    );
  }
}