import 'package:flutter/material.dart';
import 'package:SlTrade/screens/style/MyTikerInfoStyle.dart';

class MyTikerInfo extends StatefulWidget {
  @override
  _MyTikerInfoState createState() => _MyTikerInfoState();
}

class _MyTikerInfoState extends State<MyTikerInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Text('МОИ ЦЕННЫЕ БУМАГИ', style: MyTikerInfoStyle.title)
                ],
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Текущая стоимость',
                              style: MyTikerInfoStyle.valueTitle),
                          Row(
                            children: [Text('2 548 UA', style: MyTikerInfoStyle.value,)],
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Инвестировано',
                                style: MyTikerInfoStyle.valueTitle),
                            Row(children: [Text('2 045 UA', style: MyTikerInfoStyle.value,)])
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Доход', style: MyTikerInfoStyle.valueTitle),
                          Row(children: [Text('-896,55 UA', style: MyTikerInfoStyle.redValue,)])
                        ],
                      ),
                    )
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Column(
                    children: [
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Количество',
                              style: MyTikerInfoStyle.valueTitle),
                          Container(child: Text('486',style: MyTikerInfoStyle.value))
                        ],
                      )),
                    ],
                  )
                ])
              ],
            )),
          ],
        )
      ],
    );
  }
}
