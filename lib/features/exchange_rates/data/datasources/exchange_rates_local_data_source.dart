
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_st_my/core/errors/exceptions.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_settings_model.dart';

abstract class ExchangeRatesLocalDataSource {
  Future<List<CurrencySettingsModel>> getCurrencies();
  Future<void> cacheCurrencies(List<CurrencySettingsModel> settings);
}

const cachedSettings = 'CACHED_SETTINGS';

class ExchangeRatesLocalDataSourceImpl implements ExchangeRatesLocalDataSource {
  final SharedPreferences sharedPreferences;

  ExchangeRatesLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<CurrencySettingsModel>> getCurrencies() {
    final jsonString = sharedPreferences.getString(cachedSettings);
    if (jsonString != null) {
      final settings = json.decode(jsonString);
      return Future.value((settings as List).map((setting) =>
          CurrencySettingsModel.fromJson(setting)).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCurrencies(List<CurrencySettingsModel> settings) {
    return sharedPreferences.setString(
      cachedSettings,
      settings.map((setting) => json.encode(setting.toJson())).toList().toString(),
    );
  }

}