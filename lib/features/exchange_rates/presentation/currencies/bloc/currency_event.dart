part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {
  const CurrencyEvent();
}

class GetAllCurrenciesEvent extends CurrencyEvent {
  const GetAllCurrenciesEvent();
}

class ChangeStateEvent extends CurrencyEvent {
  final List<Currency> currencies;

  const ChangeStateEvent(this.currencies);
}

class ChangeVisibleStatusEvent extends CurrencyEvent {
  final CurrencyVisibilityChange state;
  final bool value;
  final int index;

  const ChangeVisibleStatusEvent(this.state, this.value, this.index);
}

class ChangeOrderEvent extends CurrencyEvent {
  final CurrencyVisibilityChange state;
  final int oldIndex;
  int newIndex;

  ChangeOrderEvent(this.state, this.oldIndex, this.newIndex);
}

class CacheDataEvent extends CurrencyEvent {
  final CurrencyVisibilityChange state;

  const CacheDataEvent(this.state);
}