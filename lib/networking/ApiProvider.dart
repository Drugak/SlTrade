import 'package:SlTrade/networking/CustomExceptions.dart';
import 'ResponseStatusCheck.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "http://94.153.229.150:8080/SLTradeTest/api";
  final String _authUrl = "http://94.153.229.150:8080/IcuTest/api/mobile";

  Future<dynamic> get({String url}) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = responseCheck(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic bodyRequest) async {
    var responseJson;
    try {
      final response = await http.post(_authUrl + url,
          headers: {'Content-Type': 'application/json'}, body: bodyRequest);
      responseJson = responseCheck(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
