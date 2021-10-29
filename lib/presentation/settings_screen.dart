
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_st_my/cubit/currency_cubit.dart';

class SettingsScreen extends StatelessWidget {

  final CurrencyCubit cubit;

  const SettingsScreen(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, dynamic>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white70,
            leading: IconButton(
              onPressed: () {
                cubit.emitLoadedState(state.currencies);
                Navigator.pop(context);
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
                  cubit.emitLoadedState(state.currencies);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: buildBodySettingsContainer(state),
        );
      },
    );
  }

  Widget buildBodySettingsContainer(dynamic state) {
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
              onReorder: (int oldIndex, int newIndex) {  },
              itemCount: state.currencies.length,
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
                            state.currencies[index].abbreviation,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${state.currencies[index].scale} ${state.currencies[index].name}',
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
                            value: state.currencies[index].isVisible,
                            onChanged: (bool value) {
                              state.currencies[index].isVisible = value;
                              cubit.changeVisibleStatus(state.currencies);
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