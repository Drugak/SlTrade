import 'package:SlTrade/networking/ApiProvider.dart';
import 'dart:async';

class SecuritieRepository {
  ApiProvider _provider = ApiProvider();

  Future<List> fetchSecuritieData() async {
    var response = await _provider.get(url: "/getIssueList?0");
    return response;
  }

  Future<List> fetchSecuritieHistoryData(tikerName) async {
    var response = await _provider.get(url: "/getdeallist?$tikerName");
    return response;
  }

  Future<List> fetchExchangeTransactionData(tikerName, bid_or_ask) async {
    var response = await _provider.get(
        url: "/getquotelist?name=$tikerName&side=$bid_or_ask");
    return response;
  }
}
