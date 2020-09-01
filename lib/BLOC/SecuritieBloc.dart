import 'dart:async';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/SecuritieRepository.dart';
import 'package:SlTrade/models/SecuritieModel.dart';

class SecuritieBloc {
  SecuritieRepository _securitieRepository;
  StreamController _securitieController;

  StreamSink<Response<List<SecuritieModel>>> get securitieSink =>
      _securitieController.sink;

  Stream<Response<List<SecuritieModel>>> get securitieStream =>
      _securitieController.stream;

  SecuritieBloc() {
    _securitieController = StreamController<Response<List<SecuritieModel>>>();
    _securitieRepository = SecuritieRepository();
    fetchSecuritieData();
  }

  fetchSecuritieData() async {
    securitieSink.add(Response.loading('Getting securities.'));
    try {
      var securitiesResponse = await _securitieRepository.fetchSecuritieData();
      List<SecuritieModel> _response = await securitiesResponse
          .map((m) => SecuritieModel.fromJson(m))
          .toList();
      await securitieSink.add(Response.completed(_response));
    } catch (e) {
      securitieSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _securitieController?.close();
  }
}
