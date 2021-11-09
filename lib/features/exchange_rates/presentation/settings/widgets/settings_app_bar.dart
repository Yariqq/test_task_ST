import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CurrencyCubit cubit;
  final CurrencyVisibilityChange state;

  const SettingsAppBar(this.cubit, this.state, {Key? key}) : super(key: key);

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
            cubit.saveData(state);
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