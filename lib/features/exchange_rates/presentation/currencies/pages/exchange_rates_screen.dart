import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/all_currencies_body.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/currencies_app_bar.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/loading_indicator.dart';
import 'package:test_app_st_my/injection_container.dart';

class ExchangeRatesScreen extends StatelessWidget {
  final CurrencyCubit cubit;

  const ExchangeRatesScreen(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state is CurrencyLoaded ?
          CurrenciesAppBar(state, cubit) : null,
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