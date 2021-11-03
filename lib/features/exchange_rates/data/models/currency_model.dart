
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel({
    required int id,
    required String date,
    required String abbreviation,
    required int scale,
    required String name,
    required double rate,
    required bool isVisible,
  }) : super(
    id: id,
    date: date,
    abbreviation: abbreviation,
    scale: scale,
    name: name,
    rate: rate,
    isVisible: isVisible,
  );

  factory CurrencyModel.fromJson(Map<String, dynamic> map) {
    return CurrencyModel(
      id: map['Cur_ID'],
      date: parseDate(map['Date']),
      abbreviation: map['Cur_Abbreviation'],
      scale: map['Cur_Scale'],
      name: map['Cur_Name'],
      rate: map['Cur_OfficialRate'],
      isVisible: map['Is_Visible'] ?? true,
    );
  }

  static String parseDate(String dateFromJson) {
    if (dateFromJson.contains('T')) {
      return '${dateFromJson.split('T')[0].split('-')[2]}.'
          '${dateFromJson.split('T')[0].split('-')[1]}.'
          '${dateFromJson.split('T')[0].split('-')[0]}';
    }
    return dateFromJson;
  }
}