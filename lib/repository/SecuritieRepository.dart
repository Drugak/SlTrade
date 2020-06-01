import 'package:SlTrade/networking/ApiProvider.dart';
import 'dart:async';

class SecuritieRepository {
  ApiProvider _provider = ApiProvider();

  Future<List> fetchSecuritieData() async {
    var response = await _provider.get("/getIssueList?0");
    return response;
  }

  Future<List> fetchSecuritieHistoryData(tikerName) async {
    var response = await _provider.get("/getdeallist?${tikerName}");
    return response;
  }
}