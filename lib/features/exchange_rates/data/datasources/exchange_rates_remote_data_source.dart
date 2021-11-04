import 'dart:convert';

import 'package:test_app_st_my/features/exchange_rates/data/models/currency_model.dart';
import 'package:http/http.dart' as http;

abstract class ExchangeRatesRemoteDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();
}

class ExchangeRatesRemoteDataSourceImpl implements ExchangeRatesRemoteDataSource {
  final http.Client client;

  ExchangeRatesRemoteDataSourceImpl(this.client);

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await client.get(
      Uri.parse('https://www.nbrb.by/api/exrates/rates?periodicity=0'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final currencies = json.decode(response.body);
      return (currencies as List).map((currency) =>
          CurrencyModel.fromJson(currency)).toList();
    } else {
      return [];
    }
  }

}