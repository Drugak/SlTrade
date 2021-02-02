import 'dart:async';
import 'dart:convert';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/AuthRepository.dart';
import 'package:SlTrade/models/AuthModel.dart';
import 'package:password_hash/password_hash.dart';

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

      var generator = new PBKDF2();

      var hash = generator.generateKey(
          'secretkey', _response.salt, _response.iterations, _response.keysize);

      print("=======%%%%%%%%++++++++++++");

      print(hash);
      print("=======%%%%%%%%++++++++++++");

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
