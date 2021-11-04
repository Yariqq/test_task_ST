
import 'package:test_app_st_my/core/errors/exceptions.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/repositories/exchange_rates_repository.dart';

class ExchangeRatesRepositoryImpl implements ExchangeRatesRepository {
  final ExchangeRatesRemoteDataSource remoteDataSource;

  ExchangeRatesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Currency>> getAllCurrencies() async {
    try {
      return await remoteDataSource.getAllCurrencies();
    } on ServerException {
      return [];
    }
  }

}