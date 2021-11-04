import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/exchange_rates/presentation/currencies/cubit/currency_cubit.dart';
import 'features/exchange_rates/presentation/currencies/pages/exchange_rates_screen.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => serviceLocator<CurrencyCubit>(),
        child: const ExchangeRatesScreen(),
      ),
    );
  }
}
