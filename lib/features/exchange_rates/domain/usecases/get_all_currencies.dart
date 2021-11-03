
import 'package:test_app_st_my/core/usecases/usecase.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/repositories/exchange_rates_repository.dart';

class GetAllCurrencies implements UseCase<List<Currency>> {
  final ExchangeRatesRepository repository;

  GetAllCurrencies(this.repository);

  @override
  Future<List<Currency>> call() async {
    return await repository.getAllCurrencies();
  }
}