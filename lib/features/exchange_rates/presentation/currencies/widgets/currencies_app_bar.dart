
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/settings/pages/settings_screen.dart';

class CurrenciesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CurrencyLoaded state;
  final CurrencyBloc bloc;

  const CurrenciesAppBar(this.state, this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      title: const Text(
        'Курсы валют',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        if (state.currencies.isNotEmpty)
        IconButton(
          onPressed: () {
            bloc.add(ChangeStateEvent(state.currencies));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen(bloc)));
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

}