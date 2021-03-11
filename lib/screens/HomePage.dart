import 'package:flutter/material.dart';
import 'package:SlTrade/BLOC/AuthBloc.dart';
import 'package:SlTrade/networking/Response.dart';

//Pages
import 'package:SlTrade/screens/SecuritiesPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AuthBloc();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => _bloc.preLoginRequest(),
        child: StreamBuilder(
            stream: _bloc.authStream,
            builder: (context, shapshot) {
              if (shapshot.hasData) {
                switch (shapshot.data.status) {
                  case Status.LOADING:
                    break;
                  case Status.COMPLETED:
                    return Container(
                      child: Scaffold(
                        resizeToAvoidBottomInset: false,
                        body: SecuritiesPage(),
                      ),
                    );
                    break;
                  case Status.ERROR:
                    return Text('Error');
                    break;
                }
              } else {
                return Text('Что-то с ответом от сервера');
              }
            }));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
