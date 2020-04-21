import 'dart:async';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/SecuritieRepository.dart';
import 'package:SlTrade/models/SecuritieModel.dart';

class SecuritieBloc {
  SecuritieRepository _securitieRepository;
  StreamController _securitieController;

  StreamSink<Response<SecuritieModel>> get securitieSink =>
      _securitieController.sink;

  Stream<Response<SecuritieModel>> get securitieStream =>
      _securitieController.stream;

  SecuritieBloc() {
    _securitieController = StreamController<Response<SecuritieModel>>();
    _securitieRepository = SecuritieRepository();
    fetchSecuritieData();
  }

  fetchSecuritieData() async {
    securitieSink.add(Response.loading('Getting securities.'));
    try {
      SecuritieModel securitiesResponse = await _securitieRepository.fetchSecuritieData();
      securitieSink.add(Response.completed(securitiesResponse));
    } catch (e) {
      securitieSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _securitieController?.close();
  }
}