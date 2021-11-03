import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_st_my/features/exchange_rates/data/models/currency_model.dart';
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';

void main() {
  final tCurrencyModel = CurrencyModel(
    id: 1,
    date: '03.11.2021',
    abbreviation: 'Test',
    scale: 1,
    name: 'TestName',
    rate: 2.0,
    isVisible: true,
  );

  test(
    'should be a subclass of currency entity',
    () async {
      expect(tCurrencyModel, isA<Currency>());
    },
  );

  test(
    'should return a valid model from JSON string',
    () async {
      final Map<String, dynamic> tJsonMap = {
        "Cur_ID":1,
        "Date":"2021-11-03T00:00:00",
        "Cur_Abbreviation":"Test",
        "Cur_Scale":1,
        "Cur_Name":"TestName",
        "Cur_OfficialRate":2.0,
      };

      final result = CurrencyModel.fromJson(tJsonMap);
      expect(result, tCurrencyModel);
    },
  );
}