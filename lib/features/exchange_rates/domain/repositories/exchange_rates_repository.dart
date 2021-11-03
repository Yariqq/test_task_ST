
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';

abstract class ExchangeRatesRepository {
  Future<List<Currency>> getAllCurrencies();
}