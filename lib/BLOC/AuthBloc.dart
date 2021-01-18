import 'dart:async';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/AuthRepository.dart';
import 'package:SlTrade/models/AuthModel.dart';

class AuthBloc {
  AuthPreloginModelRepository _authPreloginModelRepository;
  StreamController _authPreloginModelController;

  StreamSink<Response<List<AuthPreloginModel>>> get authSink =>
      _authPreloginModelController.sink;

  Stream<Response<List<AuthPreloginModel>>> get authStream =>
      _authPreloginModelController.stream;

  AuthBloc() {
    _authPreloginModelController =
        StreamController<Response<List<AuthPreloginModel>>>();
    _authPreloginModelRepository = AuthPreloginModelRepository();
    preLoginRequest();
  }

  preLoginRequest() async {
    authSink.add(Response.loading('Pre login request.'));
    try {
      var authResponse = await _authPreloginModelRepository.fetchPreLoginData();
      print("======*****=======");
      print(authResponse);
      print("======*****=======");
      // List<AuthPreloginModel> _response = authResponse
      //     .map((m) => print(m)
      //         // (m) => AuthPreloginModel.fromJson(m)
      //         )
      //     .toList();

      authResponse.map((m) {
        print(m);
        return m;
      }
          // (m) => AuthPreloginModel.fromJson(m)
          );

      // authSink.add(Response.completed(_response));

      // print(_response);
      print("DRUGAK");
    } catch (e) {
      authSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _authPreloginModelController?.close();
  }
}
