
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_model.dart';

abstract class ExchangeRatesLocalDataSource {
  Future<CurrencyModel> getCurrencies();
  Future<void> cacheCurrencies(List<CurrencyModel> currencies);
}

class ExchangeRatesLocalDataSourceImpl implements ExchangeRatesLocalDataSource {
  final SharedPreferences sharedPreferences;

  ExchangeRatesLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<CurrencyModel> getCurrencies() {
    // TODO: implement getCurrencies
    throw UnimplementedError();
  }

  @override
  Future<void> cacheCurrencies(List<CurrencyModel> currencies) {
    // TODO: implement cacheCurrencies
    throw UnimplementedError();
  }

}