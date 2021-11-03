// Mocks generated by Mockito 5.0.16 from annotations
// in test_app_st_my/test/features/exchange_rates/data/repositories/exchange_rates_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart'
    as _i5;
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart'
    as _i3;
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_model.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCurrencyModel_0 extends _i1.Fake implements _i2.CurrencyModel {}

/// A class which mocks [ExchangeRatesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExchangeRatesRemoteDataSource extends _i1.Mock
    implements _i3.ExchangeRatesRemoteDataSource {
  MockExchangeRatesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.CurrencyModel>> getAllCurrencies() =>
      (super.noSuchMethod(Invocation.method(#getAllCurrencies, []),
              returnValue:
                  Future<List<_i2.CurrencyModel>>.value(<_i2.CurrencyModel>[]))
          as _i4.Future<List<_i2.CurrencyModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [ExchangeRatesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExchangeRatesLocalDataSource extends _i1.Mock
    implements _i5.ExchangeRatesLocalDataSource {
  MockExchangeRatesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CurrencyModel> getCurrencies() => (super.noSuchMethod(
          Invocation.method(#getCurrencies, []),
          returnValue: Future<_i2.CurrencyModel>.value(_FakeCurrencyModel_0()))
      as _i4.Future<_i2.CurrencyModel>);
  @override
  _i4.Future<void> cacheCurrencies(List<_i2.CurrencyModel>? currencies) =>
      (super.noSuchMethod(Invocation.method(#cacheCurrencies, [currencies]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
}
