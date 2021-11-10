import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/all_currencies_body.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/currencies_app_bar.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/loading_indicator.dart';

class ExchangeRatesScreen extends StatelessWidget {
  final CurrencyBloc bloc;

  const ExchangeRatesScreen(this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state is CurrencyLoaded ?
          CurrenciesAppBar(state, bloc) : null,
          body: Builder(
            builder: (_) {
              if (state is CurrencyInitial) {
                return const LoadingIndicator();
              } else if (state is CurrencyLoaded) {
                return AllCurrenciesBody(state.currencies);
              }
              return const LoadingIndicator();
            },
          ),
        );
      },
    );
  }

}