import 'package:SlTrade/widgets/AllSecurities.dart';
import 'package:flutter/material.dart';
import 'package:SlTrade/widgets/RialtoStatus.dart';
import 'package:SlTrade/widgets/MySecurities.dart';
import 'package:SlTrade/BLOC/SecuritieBloc.dart';
import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/models/SecuritieModel.dart';

class SecuritiesPage extends StatefulWidget {
  @override
  _SecuritiesPageState createState() => _SecuritiesPageState();
}

class _SecuritiesPageState extends State<SecuritiesPage> {
  SecuritieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SecuritieBloc();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _bloc.fetchSecuritieData(),
      child: StreamBuilder<Response<SecuritieModel>>(
        stream: _bloc.securitieStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return Text(snapshot.data.message);
                break;
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      RialtoStatusWidget(),
                      // SearchWidget(),
                      MySecuritiesWidget(),
                      AllSecuritiesWidget(listOfSecuritie: snapshot.data.data),
                    ],
                  )
                );
                break;
              case Status.ERROR:
                return Text('Error');
                break;
            }
          }
          return Text('ну ты и лалка Виталик');
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
