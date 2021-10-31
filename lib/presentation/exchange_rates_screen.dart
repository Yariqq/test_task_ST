
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/cubit/currency_cubit.dart';
import 'package:test_app_st_my/data/model/currency.dart';
import 'package:test_app_st_my/presentation/settings_screen.dart';

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
          AppBar(
            backgroundColor: Colors.white70,
            title: const Text(
              'Курсы валют',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.emitChangeCurrencyState(state.currencies);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsScreen(cubit)));
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ],
          ) : null,
          body: Builder(
            builder: (context) {
              if (state is CurrencyInitial) {
                return buildLoadingIndicator();
              } else if (state is CurrencyLoaded) {
                return buildBodyContainer(state.currencies);
              }
              return buildLoadingIndicator();
            },
          ),
        );
      },
    );
  }

  Widget buildBodyContainer(List<Currency> currencies) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 40,
          color: Colors.grey.withOpacity(0.4),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              currencies.first.date,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                return currencies[index].isVisible ? Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currencies[index].abbreviation,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${currencies[index].scale} ${currencies[index].name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${currencies[index].rate}',
                      ),
                    ],
                  ),
                ) : Container();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

}