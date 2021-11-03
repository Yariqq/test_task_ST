
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';

class AllCurrenciesBody extends StatelessWidget {
  final List<Currency> currencies;

  const AllCurrenciesBody(this.currencies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currencies.isNotEmpty ?
    Column(
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
    ) :
    const Center(
      child: Text(
        'Не удалось получить курсы валют.',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.red
        ),
      ),
    );
  }

}