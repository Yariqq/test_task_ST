
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/repositories/exchange_rates_repository_impl.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/cache_currencies_settings.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';
import 'features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart';
import 'features/exchange_rates/domain/repositories/exchange_rates_repository.dart';
import 'package:cherrypick/cherrypick.dart';

import 'features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';

class InjectionContainer extends Module {

  final SharedPreferences sharedPreferences;

  InjectionContainer(this.sharedPreferences);

  @override
  Future<void> builder(Scope currentScope) async {
    //CUBIT
    bind<CurrencyBloc>().toProvide(() => CurrencyBloc(
      currentScope.resolve<GetAllCurrencies>(),
      currentScope.resolve<CacheCurrenciesSettings>(),
    ));

    //USECASES
    bind<GetAllCurrencies>().toProvide(() => GetAllCurrencies(
      currentScope.resolve<ExchangeRatesRepository>(),
    )).singeltone();

    bind<CacheCurrenciesSettings>().toProvide(() => CacheCurrenciesSettings(
      currentScope.resolve<ExchangeRatesRepository>(),
    )).singeltone();

    //REPOSITORY
    bind<ExchangeRatesRepository>().toProvide(() => ExchangeRatesRepositoryImpl(
      remoteDataSource: currentScope.resolve<ExchangeRatesRemoteDataSource>(),
      localDataSource: currentScope.resolve<ExchangeRatesLocalDataSource>(),
    )).singeltone();

    //DATASOURCES
    bind<ExchangeRatesRemoteDataSource>().toProvide(() =>
        ExchangeRatesRemoteDataSourceImpl(
          currentScope.resolve<Dio>(),
        )).singeltone();

    bind<ExchangeRatesLocalDataSource>().toProvide(() =>
        ExchangeRatesLocalDataSourceImpl(
          currentScope.resolve<SharedPreferences>(),
        )).singeltone();

    //THIRD-PARTY LIBRARIES
    bind<Dio>().toInstance(Dio()).singeltone();
    bind<SharedPreferences>().toInstance(sharedPreferences).singeltone();
  }

}
