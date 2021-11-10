import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';
import 'features/exchange_rates/presentation/currencies/pages/exchange_rates_screen.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final scope = openRootScope().installModules([InjectionContainer(sharedPreferences)]);
  final bloc = scope.resolve<CurrencyBloc>();
  bloc.add(const GetAllCurrenciesEvent());
  runApp(MyApp(bloc));
}

class MyApp extends StatelessWidget {
  final CurrencyBloc bloc;
  const MyApp(this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => bloc,
        child: ExchangeRatesScreen(bloc),
      ),
    );
  }
}
