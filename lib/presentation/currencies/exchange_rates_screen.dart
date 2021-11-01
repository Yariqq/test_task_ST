
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/cubit/currency_cubit.dart';
import 'package:test_app_st_my/presentation/currencies/all_currencies_body.dart';
import 'package:test_app_st_my/presentation/currencies/currencies_app_bar.dart';
import 'package:test_app_st_my/presentation/currencies/loading_indicator.dart';

class ExchangeRatesScreen extends StatelessWidget {
  const ExchangeRatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrencyCubit cubit = BlocProvider.of<CurrencyCubit>(context);
    cubit.getAllCurrencies();
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state is CurrencyLoaded ?
          CurrenciesAppBar(cubit, state) : null,
          body: Builder(
            builder: (context) {
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