
import 'dart:convert';

import 'package:test_app_st_my/data/model/currency.dart';
import 'package:http/http.dart' as http;

abstract class CurrencyRepository {
  Future<List<Currency>> getAllCurrencies();
}

class CurrencyRepositoryImpl implements CurrencyRepository {

  @override
  Future<List<Currency>> getAllCurrencies() async {
    final response = await http.get(
      Uri.parse('https://www.nbrb.by/api/exrates/rates?periodicity=0'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final currencies = json.decode(response.body);
      return (currencies as List).map((currency) => Currency.fromJson(currency)).toList();
    } else {
      print('Got error: ${response.statusCode}');
      throw Error();
    }
  }

}