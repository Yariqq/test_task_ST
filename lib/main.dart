import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/cubit/currency_cubit.dart';
import 'package:test_app_st_my/data/repository/currency_repository.dart';
import 'package:test_app_st_my/presentation/exchange_rates_screen.dart';

void main() {
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
        create: (context) => CurrencyCubit(CurrencyRepositoryImpl()),
        child: const ExchangeRatesScreen(),
      ),
    );
  }
}
