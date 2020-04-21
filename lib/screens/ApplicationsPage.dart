import 'package:SlTrade/widgets/RialtoStatus.dart';
import 'package:flutter/material.dart';
import 'package:SlTrade/widgets/Securitie.dart';

class ApplicationsPage extends StatefulWidget {
  @override
  _ApplicationsStatePage createState() => _ApplicationsStatePage();
}

class _ApplicationsStatePage extends State<ApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        RialtoStatusWidget(),
        SecuritieWidget(
            tikerName: 'AZST',
            fullName: 'Azovstal',
            bid: '6,938',
            bidPercentage: 1.22,
            ask: '6,938',
            askPercentage: -1.22,
            fullVersion: true),
        DefaultTabController(
  length: 3,
  child: Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
    ),
  ),
)
      ],
    );
  }
}
