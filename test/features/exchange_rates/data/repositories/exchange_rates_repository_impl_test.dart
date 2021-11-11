
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_st_my/core/errors/exceptions.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_model.dart';
import 'package:test_app_st_my/features/exchange_rates/data/repositories/exchange_rates_repository_impl.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';

import 'exchange_rates_repository_impl_test.mocks.dart';

@GenerateMocks([ExchangeRatesRemoteDataSource, ExchangeRatesLocalDataSource])
void main() {
  late ExchangeRatesRepositoryImpl repository;
  late MockExchangeRatesRemoteDataSource mockRemoteDataSource;
  late MockExchangeRatesLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockExchangeRatesRemoteDataSource();
    mockLocalDataSource = MockExchangeRatesLocalDataSource();
    repository = ExchangeRatesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  final tCurrenciesModels = [
    CurrencyModel(
      id: 1,
      date: '10.10.2010',
      abbreviation: 'Test',
      scale: 1,
      name: 'TestName',
      rate: 2.0,
      isVisible: true,
    ),
    CurrencyModel(
      id: 2,
      date: '10.10.2011',
      abbreviation: 'Test1',
      scale: 1,
      name: 'TestName1',
      rate: 2.0,
      isVisible: true,
    ),
  ];

  final List<Currency> tCurrencies = tCurrenciesModels;

  // test(
  //   'should return data from remote data source if response is not an error',
  //   () async {
  //     when(mockRemoteDataSource.getAllCurrencies())
  //         .thenAnswer((_) async => tCurrenciesModels);
  //     final result = await repository.getAllCurrencies();
  //     expect(result, tCurrencies);
  //   },
  // );

  // test(
  //   'should return exception from remote data source if response is an error',
  //       () async {
  //     when(mockRemoteDataSource.getAllCurrencies())
  //         .thenThrow((_) async => []);
  //     final result = await repository.getAllCurrencies();
  //     expect(result, []);
  //   },
  // );
}