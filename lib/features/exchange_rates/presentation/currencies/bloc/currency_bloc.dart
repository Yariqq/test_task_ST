
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_settings_model.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/cache_currencies_settings.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/usecases/get_all_currencies.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetAllCurrencies getAllCurrenciesUseCase;
  final CacheCurrenciesSettings cacheCurrenciesSettingsUseCase;

  CurrencyBloc(this.getAllCurrenciesUseCase,
      this.cacheCurrenciesSettingsUseCase) : super(const CurrencyInitial()) {
    on<GetAllCurrenciesEvent>((event, emit) async {
      final currencies = await getAllCurrenciesUseCase(NoParams());
      emit(CurrencyLoaded(currencies));
    });

    on<ChangeStateEvent>((event, emit) async {
      emit(CurrencyVisibilityChange(event.currencies));
    });

    on<ChangeVisibleStatusEvent>((event, emit) async {
      event.state.currenciesChangeList[event.index].isVisible = event.value;
      emit(CurrencyVisibilityChange(event.state.currenciesChangeList));
    });

    on<ChangeOrderEvent>((event, emit) async {
      if (event.newIndex > event.oldIndex) {
        event.newIndex -= 1;
      }
      final item = event.state.currenciesChangeList.removeAt(event.oldIndex);
      event.state.currenciesChangeList.insert(event.newIndex, item);
      emit(CurrencyVisibilityChange(event.state.currenciesChangeList));
    });

    on<CacheDataEvent>((event, emit) async {
      await cacheCurrenciesSettingsUseCase(
          Params(settings: getSettings(event.state)));
      emit(CurrencyLoaded(event.state.currenciesChangeList));
    });
  }

  List<CurrencySettingsModel> getSettings(CurrencyVisibilityChange state) {
    List<CurrencySettingsModel> settings = [];
    for (int i = 0; i < state.currenciesChangeList.length; i++) {
      settings.add(CurrencySettingsModel(id: state.currenciesChangeList[i].id,
          isVisible: state.currenciesChangeList[i].isVisible));
    }
    return settings;
  }

}
