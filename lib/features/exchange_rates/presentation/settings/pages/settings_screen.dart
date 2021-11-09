import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/widgets/loading_indicator.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/settings/widgets/settings_app_bar.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/settings/widgets/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  final CurrencyCubit cubit;

  const SettingsScreen(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: state is CurrencyVisibilityChange ?
            SettingsAppBar(cubit, state) : null,
          body: Builder(
            builder: (context) {
              if (state is CurrencyVisibilityChange) {
                return SettingsBody(state: state, cubit: cubit);
              }
              return const LoadingIndicator();
            },
          ),
        );
      },
    );
  }

}