
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/cubit/currency_cubit.dart';
import 'package:test_app_st_my/data/model/currency.dart';

class ExchangeRatesScreen extends StatelessWidget {
  const ExchangeRatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
          'Курсы валют',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
        builder: (context, state) {
          BlocProvider.of<CurrencyCubit>(context).getAllCurrencies();
          if (state is CurrencyInitial) {
            return buildLoadingIndicator();
          } else if (state is CurrencyLoaded) {
            return buildBodyContainer(state.currencies);
          }
          return buildLoadingIndicator();
        },
      ),
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
                return Padding(
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
                );
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