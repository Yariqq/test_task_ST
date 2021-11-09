
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/repositories/exchange_rates_repository_impl.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/cache_currencies_settings.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'package:http/http.dart' as http;
import 'features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart';
import 'features/exchange_rates/domain/repositories/exchange_rates_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => CurrencyCubit(
    serviceLocator(),
    serviceLocator(),
  ));
  serviceLocator.registerLazySingleton(() => GetAllCurrencies(serviceLocator()));
  serviceLocator.registerLazySingleton(() => CacheCurrenciesSettings(serviceLocator()));
  serviceLocator.registerLazySingleton<ExchangeRatesRepository>(() =>
      ExchangeRatesRepositoryImpl(
        remoteDataSource: serviceLocator(),
        localDataSource: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton<ExchangeRatesRemoteDataSource>(() =>
      ExchangeRatesRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ExchangeRatesLocalDataSource>(() =>
      ExchangeRatesLocalDataSourceImpl(serviceLocator()));

  serviceLocator.registerLazySingleton(() => Dio());
  // serviceLocator.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
