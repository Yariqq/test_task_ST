
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_settings_model.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';

abstract class ExchangeRatesRepository {
  Future<List<Currency>> getAllCurrencies();
  Future<void> cacheSettings(List<CurrencySettingsModel> settings);
}