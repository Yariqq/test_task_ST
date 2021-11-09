import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_settings_model.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/cache_currencies_settings.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final GetAllCurrencies getAllCurrenciesUseCase;
  final CacheCurrenciesSettings cacheCurrenciesSettingsUseCase;

  CurrencyCubit(this.getAllCurrenciesUseCase,
      this.cacheCurrenciesSettingsUseCase) : super(const CurrencyInitial());

  void emitLoadedState(List<Currency> currencyList) {
    emit(CurrencyLoaded(currencyList));
  }

  void emitChangeCurrencyState(List<Currency> changedList) {
    emit(CurrencyVisibilityChange(changedList));
  }

  Future<void> getAllCurrencies() async {
    final currencies = await getAllCurrenciesUseCase(NoParams());
    emitLoadedState(currencies);
  }

  void changeVisibleStatus(CurrencyVisibilityChange state, bool value, int index) {
    state.currenciesChangeList[index].isVisible = value;
    emitChangeCurrencyState(state.currenciesChangeList);
  }

  void reorderList(int oldIndex, int newIndex, CurrencyVisibilityChange state) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = state.currenciesChangeList.removeAt(oldIndex);
    state.currenciesChangeList.insert(newIndex, item);
    emitChangeCurrencyState(state.currenciesChangeList);
  }

  Future<void> saveData(CurrencyVisibilityChange state) async {
    List<CurrencySettingsModel> settings = [];
    for (int i = 0; i < state.currenciesChangeList.length; i++) {
      settings.add(CurrencySettingsModel(id: state.currenciesChangeList[i].id,
          isVisible: state.currenciesChangeList[i].isVisible));
    }
    await cacheCurrenciesSettingsUseCase(Params(settings: settings));
    emitLoadedState(state.currenciesChangeList);
  }
}
