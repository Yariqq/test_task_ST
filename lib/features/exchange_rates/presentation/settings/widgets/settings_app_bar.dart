import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CurrencyBloc bloc;
  final CurrencyVisibilityChange state;

  const SettingsAppBar(this.bloc, this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      leading: IconButton(
        onPressed: () {
          // cubit.emitLoadedState(state.currenciesChangeList);
          // Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: const Text(
        'Настройка валют',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            bloc.add(CacheDataEvent(state));
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.done,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

}