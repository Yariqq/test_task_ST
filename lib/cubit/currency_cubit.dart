import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app_st_my/data/local/shared_prefs.dart';
import 'package:test_app_st_my/data/model/currency.dart';
import 'package:test_app_st_my/data/model/currency_mapper.dart';
import 'package:test_app_st_my/data/repository/currency_repository.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepository _currencyRepository;

  CurrencyCubit(this._currencyRepository) : super(const CurrencyInitial());

  void emitLoadedState(List<Currency> currencyList) {
    emit(CurrencyLoaded(currencyList));
  }

  void emitChangeCurrencyState(List<Currency> changedList) {
    emit(CurrencyVisibilityChange(changedList));
  }

  Future<void> getAllCurrencies() async {
    final SharedPreferencesRepository sharedPrefs = SharedPreferencesRepository();
    var currencies = await sharedPrefs.getCurrencies('Currencies');
    if (currencies == null) {
      currencies = await _currencyRepository.getAllCurrencies();
    } else {
      currencies = (currencies as List).map((currency) =>
          CurrencyMapper.fromJson(currency)).toList();
    }
    emitLoadedState(currencies);
  }

  void changeVisibleStatus(dynamic state, bool value, int index) {
    state.currenciesChangeList[index].isVisible = value;
    emitChangeCurrencyState(state.currenciesChangeList);
  }

  void reorderList(int oldIndex, int newIndex, dynamic state) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = state.currenciesChangeList.removeAt(oldIndex);
    state.currenciesChangeList.insert(newIndex, item);
    emitChangeCurrencyState(state.currenciesChangeList);
  }
}
