import 'dart:async';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/AuthRepository.dart';
import 'package:SlTrade/models/AuthModel.dart';

class AuthBloc {
  AuthPreloginModelRepository _authPreloginModelRepository;
  StreamController _authPreloginModelController;

  StreamSink<Response<AuthPreloginModel>> get authSink =>
      _authPreloginModelController.sink;

  Stream<Response<AuthPreloginModel>> get authStream =>
      _authPreloginModelController.stream;

  AuthBloc() {
    _authPreloginModelController =
        StreamController<Response<AuthPreloginModel>>();
    _authPreloginModelRepository = AuthPreloginModelRepository();
    preLoginRequest();
  }

  preLoginRequest() async {
    authSink.add(Response.loading('Pre login request.'));

    try {
      var authResponse = await _authPreloginModelRepository.fetchPreLoginData();
      var _response = AuthPreloginModel.fromJson(authResponse);

      authSink.add(Response.completed(_response));
    } catch (e) {
      authSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _authPreloginModelController?.close();
  }
}
