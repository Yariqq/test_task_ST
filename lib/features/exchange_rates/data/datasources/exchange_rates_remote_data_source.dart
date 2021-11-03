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
    client.get(
      Uri.parse('https://www.nbrb.by/api/exrates/rates?periodicity=0'),
      headers: {
        'Content-Type': 'application/json'
      },
    );
    return await [CurrencyModel(id: 1, date: '', abbreviation: '', scale: 1, name: '', rate: 2.0, isVisible: true)];
  }

}