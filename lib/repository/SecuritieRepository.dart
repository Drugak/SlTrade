import 'package:SlTrade/networking/ApiProvider.dart';
import 'dart:async';
import 'package:SlTrade/models/SecuritieModel.dart';

class SecuritieRepository {
  ApiProvider _provider = ApiProvider();

  Future<SecuritieModel> fetchSecuritieData() async {
    final response = await _provider.get("/getIssueList?0");
    return SecuritieModel.fromJson(response);
  }
}