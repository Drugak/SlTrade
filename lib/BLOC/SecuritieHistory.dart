import 'dart:async';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/SecuritieRepository.dart';
import 'package:SlTrade/models/SecuritieHistoryModel.dart';

class SecuritieHistoryBloc {
  SecuritieRepository _securitieRepository;
  StreamController _securitieHistoryController;

  StreamSink<Response<List<SecuritieHistoryModel>>> get securitieSink =>
      _securitieHistoryController.sink;

  Stream<Response<List<SecuritieHistoryModel>>> get securitieStream =>
      _securitieHistoryController.stream;

  SecuritieHistoryBloc(tikerName) {
    _securitieHistoryController = StreamController<Response<List<SecuritieHistoryModel>>>();
    _securitieRepository = SecuritieRepository();
    fetchSecuritieHistoryData(tikerName);
  }

  fetchSecuritieHistoryData(tikerName) async {
    securitieSink.add(Response.loading('Loading history...'));
    try {
      var securitiesHistoryResponse = await _securitieRepository.fetchSecuritieHistoryData(tikerName);
      List<SecuritieHistoryModel> _response = await securitiesHistoryResponse.map((m) => SecuritieHistoryModel.fromJson(m)).toList();
      await securitieSink.add(Response.completed(_response));
    } catch (e) {
      securitieSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _securitieHistoryController?.close();
  }
}
