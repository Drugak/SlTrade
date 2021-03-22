import 'package:flutter/material.dart';

class HeaderNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        IconButton(icon: Icon(Icons.star_border_rounded))
      ],
    )
    );
  }
}
