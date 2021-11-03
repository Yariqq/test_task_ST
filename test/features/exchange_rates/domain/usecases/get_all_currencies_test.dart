
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/repositories/exchange_rates_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';

import 'get_all_currencies_test.mocks.dart';

@GenerateMocks([ExchangeRatesRepository])
void main() {
  late GetAllCurrencies usecase;
  late MockExchangeRatesRepository mockExchangeRatesRepository;

  setUp(() {
    mockExchangeRatesRepository = MockExchangeRatesRepository();
    usecase = GetAllCurrencies(mockExchangeRatesRepository);
  });

  final tCurrencies = [
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
    'should get all currencies from the repository',
    () async {
      when(mockExchangeRatesRepository.getAllCurrencies())
          .thenAnswer((_) async => tCurrencies);
      final result = await usecase();
      expect(result, tCurrencies);
      //verifyNoMoreInteractions(mockExchangeRatesRepository);
    },
  );
}