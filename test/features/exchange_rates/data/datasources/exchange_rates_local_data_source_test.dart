
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  ExchangeRatesLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ExchangeRatesLocalDataSourceImpl(mockSharedPreferences);
  });
}