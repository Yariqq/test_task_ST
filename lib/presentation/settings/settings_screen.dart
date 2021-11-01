
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/cubit/currency_cubit.dart';
import 'package:test_app_st_my/presentation/settings/settings_app_bar.dart';
import 'package:test_app_st_my/presentation/settings/settings_body.dart';

class SettingsScreen extends StatelessWidget {

  final CurrencyCubit cubit;

  const SettingsScreen(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is CurrencyVisibilityChange) {
          return Scaffold(
            appBar: SettingsAppBar(cubit, state),
            body: SettingsBody(cubit, state),
          );
        }
        return Container();
      },
    );
  }

}