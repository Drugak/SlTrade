import 'package:SlTrade/networking/ApiProvider.dart';
import 'dart:async';

class AuthRepository {
  ApiProvider _provider = ApiProvider();

  Future<List> fetchSecuritieData() async {
    var response = await _provider.post("/prelogin", {"username": "Demo1"});
    return response;
  }
}
