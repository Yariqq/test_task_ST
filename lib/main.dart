import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'features/exchange_rates/presentation/currencies/pages/exchange_rates_screen.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final scope = openRootScope().installModules([InjectionContainer(sharedPreferences)]);
  final cubit = scope.resolve<CurrencyCubit>(named: 'currencyCubit');
  await cubit.getAllCurrencies();
  runApp(MyApp(cubit));
}

class MyApp extends StatelessWidget {
  final CurrencyCubit cubit;
  const MyApp(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => cubit,
        child: ExchangeRatesScreen(cubit),
      ),
    );
  }
}
