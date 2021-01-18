import 'package:SlTrade/networking/ApiProvider.dart';
import 'dart:async';
import 'dart:convert';

class AuthPreloginModelRepository {
  ApiProvider _provider = ApiProvider();

  final body = jsonEncode({"username": "Demo1"});
  Future<Map> fetchPreLoginData() async {
    var response = await _provider.post("/prelogin", body);
    return response;
  }
}
