part of 'currency_cubit.dart';

@immutable
abstract class CurrencyState {
  const CurrencyState();
}

class CurrencyInitial extends CurrencyState {
  const CurrencyInitial();
}

class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencies;
  const CurrencyLoaded(this.currencies);
}

class CurrencyVisibilityChange extends CurrencyState {
  final List<Currency> currencies;
  const CurrencyVisibilityChange(this.currencies);
}
