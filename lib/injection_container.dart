
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/repositories/exchange_rates_repository_impl.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/cache_currencies_settings.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart';
import 'features/exchange_rates/domain/repositories/exchange_rates_repository.dart';
import 'package:cherrypick/cherrypick.dart';

class InjectionContainer extends Module {

  final SharedPreferences sharedPreferences;

  InjectionContainer(this.sharedPreferences);

  @override
  Future<void> builder(Scope currentScope) async {
    //CUBIT
    bind<CurrencyCubit>().withName('currencyCubit').toProvide(() =>
        CurrencyCubit(currentScope.resolve<GetAllCurrencies>(
            named: 'getAllCurrenciesUseCase'),
            currentScope.resolve<CacheCurrenciesSettings>(
                named: 'cacheSettingsUseCase')));

    //USECASES
    bind<GetAllCurrencies>()
        .withName('getAllCurrenciesUseCase')
        .toProvide(() =>
        GetAllCurrencies(currentScope.resolve<ExchangeRatesRepository>(
            named: 'exchangeRatesRepo'))).singeltone();

    bind<CacheCurrenciesSettings>()
        .withName('cacheSettingsUseCase')
        .toProvide(() =>
        CacheCurrenciesSettings(currentScope.resolve<ExchangeRatesRepository>(
            named: 'exchangeRatesRepo'))).singeltone();

    //REPOSITORY
    bind<ExchangeRatesRepository>()
        .withName('exchangeRatesRepo')
        .toProvide(() =>
        ExchangeRatesRepositoryImpl(remoteDataSource: currentScope.resolve<
            ExchangeRatesRemoteDataSource>(
            named: 'exchangeRatesRemoteDataSource'),
            localDataSource: currentScope.resolve<ExchangeRatesLocalDataSource>(
                named: 'exchangeRatesLocalDataSource'))).singeltone();

    //DATASOURCES
    bind<ExchangeRatesRemoteDataSource>().withName(
        'exchangeRatesRemoteDataSource').toProvide(() =>
        ExchangeRatesRemoteDataSourceImpl(
            currentScope.resolve<Dio>(named: 'dio'))).singeltone();

    bind<ExchangeRatesLocalDataSource>().withName(
        'exchangeRatesLocalDataSource').toProvide(() =>
        ExchangeRatesLocalDataSourceImpl(
            currentScope.resolve<SharedPreferences>(
                named: 'sharedPreferences'))).singeltone();

    //THIRD-PARTY LIBRARIES
    bind<Dio>().withName('dio').toInstance(Dio()).singeltone();
    //final sharedPreferences = await SharedPreferences.getInstance();
    bind<SharedPreferences>().withName('sharedPreferences').toInstance(
        sharedPreferences).singeltone();
  }

}
