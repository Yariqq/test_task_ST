
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/cache_currencies_settings.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';

import 'currency_bloc_test.mocks.dart';

class MockCacheCurrenciesSettings extends Mock implements CacheCurrenciesSettings {}

@GenerateMocks([GetAllCurrencies])
void main() {
  late CurrencyBloc bloc;
  late MockGetAllCurrencies mockGetAllCurrencies;
  MockCacheCurrenciesSettings mockCacheCurrenciesSettings;

  setUp(() {
    mockGetAllCurrencies = MockGetAllCurrencies();
    mockCacheCurrenciesSettings = MockCacheCurrenciesSettings();
    bloc = CurrencyBloc(mockGetAllCurrencies, mockCacheCurrenciesSettings);
  });

  test(
    'initialState should be CurrencyInitial',
    () {
      expect(bloc.state, const CurrencyInitial());
    },
  );

  final List<Currency> tCurrencies = [
    Currency(
      id: 1,
      date: '10.10.2010',
      abbreviation: 'Test',
      scale: 1,
      name: 'TestName',
      rate: 2.0,
      isVisible: true,
    ),
    Currency(
      id: 2,
      date: '10.10.2011',
      abbreviation: 'Test1',
      scale: 1,
      name: 'TestName1',
      rate: 2.0,
      isVisible: true,
    ),
  ];

  test(
    'should emit CurrencyLoaded when data is gotten successfully',
    () async {
      when(mockGetAllCurrencies(NoParams())).thenAnswer((_) async => tCurrencies);
      final expected = [
        const CurrencyInitial(),
        CurrencyLoaded(tCurrencies),
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      bloc.add(const GetAllCurrenciesEvent());
    },
  );
}