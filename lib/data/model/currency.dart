
class Currency {
  final int id;
  final String date;
  final String abbreviation;
  final int scale;
  final String name;
  final double rate;
  bool isVisible;

  Currency.fromJson(Map<String, dynamic> map) :
        id = map['Cur_ID'],
        date = '${map['Date'].split('T')[0].split('-')[2]}.${map['Date'].split('T')[0].split('-')[1]}.${map['Date'].split('T')[0].split('-')[0]}',
        abbreviation = map['Cur_Abbreviation'],
        scale = map['Cur_Scale'],
        name = map['Cur_Name'],
        rate = map['Cur_OfficialRate'],
        isVisible = true;
}