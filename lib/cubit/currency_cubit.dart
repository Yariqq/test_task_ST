import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app_st_my/data/model/currency.dart';
import 'package:test_app_st_my/data/repository/currency_repository.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepository _currencyRepository;

  CurrencyCubit(this._currencyRepository) : super(const CurrencyInitial());

  void emitLoadedState(List<Currency> currencyList) {
    emit(CurrencyLoaded(currencyList));
  }

  Future<void> getAllCurrencies() async {
    final currencies = await _currencyRepository.getAllCurrencies();
    emitLoadedState(currencies);
  }

  void changeVisibleStatus(List<Currency> currencyList) {
    emit(CurrencyVisibilityChange(currencyList));
  }
}
