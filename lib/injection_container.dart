
import 'package:get_it/get_it.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/repositories/exchange_rates_repository_impl.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'package:http/http.dart' as http;
import 'features/exchange_rates/domain/repositories/exchange_rates_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => CurrencyCubit(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAllCurrencies(serviceLocator()));
  serviceLocator.registerLazySingleton<ExchangeRatesRepository>(() =>
      ExchangeRatesRepositoryImpl(remoteDataSource: serviceLocator(),));
  serviceLocator.registerLazySingleton<ExchangeRatesRemoteDataSource>(() =>
      ExchangeRatesRemoteDataSourceImpl(serviceLocator()));
  // serviceLocator.registerLazySingleton<ExchangeRatesLocalDataSource>(() =>
  //     ExchangeRatesLocalDataSourceImpl(serviceLocator()));

  // final sharedPreferences = await SharedPreferences.getInstance();
  // serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
}
