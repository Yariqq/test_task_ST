
import 'package:test_app_st_my/data/model/currency.dart';

class CurrencyMapper {

  static Currency fromJson(Map<String, dynamic> map) {
    return Currency(
      id: map['Cur_ID'],
      date: '',
      abbreviation: map['Cur_Abbreviation'],
      scale: map['Cur_Scale'],
      name: map['Cur_Name'],
      rate: map['Cur_OfficialRate'],
    );
  }

  static List<Map<String, dynamic>> toJson(List<Currency> currenciesToSave) {
    List<Map<String, dynamic>> currenciesMap = [];
    for (int i = 0; i < currenciesToSave.length; i++) {
      currenciesMap.add({
        'Cur_ID': currenciesToSave[i].id,
        'Date': '',
        'Cur_Abbreviation': currenciesToSave[i].abbreviation,
        'Cur_Scale': currenciesToSave[i].scale,
        'Cur_Name': currenciesToSave[i].name,
        'Cur_OfficialRate': currenciesToSave[i].rate
      });
    }
    return currenciesMap;
  }

}