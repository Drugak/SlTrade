
import 'package:flutter/material.dart';
import 'package:SlTrade/BLOC/SecuritieBloc.dart';
import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/widgets/RialtoStatus.dart';
import 'package:SlTrade/widgets/MySecurities.dart';
import 'package:SlTrade/widgets/AllSecurities.dart';

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
          child: StreamBuilder(
            stream: _bloc.securitieStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    return Text(snapshot.data.message);
                    break;
                  case Status.COMPLETED:
                    return ListView(
                      children: <Widget>[
                          RialtoStatusWidget(),
                          MySecuritiesWidget(),
                          AllSecuritiesWidget(listOfSecuritie: snapshot.data.data)
                        ]
                      );
                    break;
                  case Status.ERROR:
                    return Text('Error');
                    break;
                }
              } else {
                return Text('Что-то с ответом от сервера');
              }
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
