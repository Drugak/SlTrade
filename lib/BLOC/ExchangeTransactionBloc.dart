import 'dart:async';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/SecuritieRepository.dart';
import 'package:SlTrade/models/ExchangeTransactionModel.dart';

class ExchangeTransactionBloc {
  SecuritieRepository _securitieRepository;
  StreamController _securitieController;

  StreamSink<Response<List<ExchangeTransactionModel>>> get securitieSink =>
      _securitieController.sink;

  Stream<Response<List<ExchangeTransactionModel>>> get securitieStream =>
      _securitieController.stream;

  ExchangeTransactionBloc(tikerName, bidOrAsk) {
    _securitieController =
        StreamController<Response<List<ExchangeTransactionModel>>>();
    _securitieRepository = SecuritieRepository();
    fetchExchangeTransaction(tikerName, bidOrAsk);
  }

  fetchExchangeTransaction(tikerName, bidOrAsk) async {
    securitieSink.add(Response.loading('Getting Exchange Transaction Data.'));
    try {
      var securitiesResponse = await _securitieRepository
          .fetchExchangeTransactionData(tikerName, bidOrAsk);
      List<ExchangeTransactionModel> _response = await securitiesResponse
          .map((m) => ExchangeTransactionModel.fromJson(m))
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
