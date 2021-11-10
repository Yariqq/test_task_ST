
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_st_my/features/exchange_rates/presentation/currencies/bloc/currency_bloc.dart';

class SettingsBody extends StatelessWidget {
  final CurrencyVisibilityChange state;
  final CurrencyBloc bloc;

  const SettingsBody({required this.state, required this.bloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 40,
          color: Colors.grey.withOpacity(0.4),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ReorderableListView.builder(
              onReorder: (int oldIndex, int newIndex) {
                bloc.add(ChangeOrderEvent(state, oldIndex, newIndex));
              },
              itemCount: state.currenciesChangeList.length,
              itemBuilder: (context, index) {
                return Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.currenciesChangeList[index].abbreviation,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${state.currenciesChangeList[index].scale} ${state
                                .currenciesChangeList[index].name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Switch(
                            value: state.currenciesChangeList[index].isVisible,
                            onChanged: (bool value) {
                              bloc.add(ChangeVisibleStatusEvent(
                                  state, value, index));
                            },
                          ),
                          const SizedBox(width: 50),
                          const Icon(
                            Icons.view_headline,
                          ),
                        ],
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

}