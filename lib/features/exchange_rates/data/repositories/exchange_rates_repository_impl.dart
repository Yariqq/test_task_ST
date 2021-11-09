
import 'package:test_app_st_my/core/errors/exceptions.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_model.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_settings_model.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/repositories/exchange_rates_repository.dart';

class ExchangeRatesRepositoryImpl implements ExchangeRatesRepository {
  final ExchangeRatesRemoteDataSource remoteDataSource;
  final ExchangeRatesLocalDataSource localDataSource;

  ExchangeRatesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Currency>> getAllCurrencies() async {
    try {
      final savedSettings = await localDataSource.getCurrencies();
      final allCurrencies = await remoteDataSource.getAllCurrencies();
      return sortCurrencyListBySettings(allCurrencies, savedSettings);
    } catch (e) {
      if (Exception is ServerException) {
        return [];
      } else if (Exception is CacheException) {
        return await remoteDataSource.getAllCurrencies();
      } else {
        return [];
      }
    }
  }

  List<Currency> sortCurrencyListBySettings(
      List<CurrencyModel> initialCurrencyList,
      List<CurrencySettingsModel> settingsList) {
    final List<Currency> sortedCurrencyList = [];
    for (int i = 0; i < settingsList.length; i++) {
      for (int j = 0; j < initialCurrencyList.length; j++) {
        if (initialCurrencyList[j].id == settingsList[i].id) {
          initialCurrencyList[j].isVisible = settingsList[i].isVisible;
          sortedCurrencyList.add(initialCurrencyList[j]);
          break;
        }
      }
    }
    return sortedCurrencyList;
  }

  @override
  Future<void> cacheSettings(List<CurrencySettingsModel> settings) async {
    localDataSource.cacheCurrencies(settings);
  }

}