
import 'package:equatable/equatable.dart';
import 'package:test_app_st_my/core/usecases/usecase.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_settings_model.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/repositories/exchange_rates_repository.dart';

class CacheCurrenciesSettings implements UseCase<void, Params> {
  final ExchangeRatesRepository repository;

  CacheCurrenciesSettings(this.repository);
  
  @override
  Future<void> call(Params params) async {
    repository.cacheSettings(params.settings);
  }
  
}

class Params extends Equatable {
  final List<CurrencySettingsModel> settings;

  const Params({required this.settings});

  @override
  List<Object?> get props => [settings];
}