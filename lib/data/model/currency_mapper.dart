
import 'package:test_app_st_my/data/model/currency.dart';

class CurrencyMapper {

  static Currency fromJson(Map<String, dynamic> map) {
    return Currency(
      id: map['Cur_ID'],
      date: parseDate(map['Date']),
      abbreviation: map['Cur_Abbreviation'],
      scale: map['Cur_Scale'],
      name: map['Cur_Name'],
      rate: map['Cur_OfficialRate'],
      isVisible: map['Is_Visible'] ?? true,
    );
  }

  static List<Map<String, dynamic>> toJson(List<Currency> currenciesToSave) {
    List<Map<String, dynamic>> currenciesMap = [];
    for (int i = 0; i < currenciesToSave.length; i++) {
      currenciesMap.add({
        'Cur_ID': currenciesToSave[i].id,
        'Date': currenciesToSave[i].date,
        'Cur_Abbreviation': currenciesToSave[i].abbreviation,
        'Cur_Scale': currenciesToSave[i].scale,
        'Cur_Name': currenciesToSave[i].name,
        'Cur_OfficialRate': currenciesToSave[i].rate,
        'Is_Visible': currenciesToSave[i].isVisible
      });
    }
    return currenciesMap;
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