import 'package:SlTrade/networking/ApiProvider.dart';
import 'dart:async';

class SecuritieRepository {
  ApiProvider _provider = ApiProvider();

  Future<List> fetchSecuritieData() async {
    var response = await _provider.get("/getIssueList?0");
    return response;
  }

  Future<List> fetchSecuritieHistoryData(tikerName) async {
    var response = await _provider.get("/getdeallist?$tikerName");
    return response;
  }

  Future<List> fetchExchangeTransactionData(tikerName, bid_or_ask) async {
    var response = await _provider.get("/getquotelist?name=$tikerName&side=$bid_or_ask");
    return response;
  }
}