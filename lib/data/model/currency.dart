
class Currency {
  final int id;
  final String date;
  final String abbreviation;
  final int scale;
  final String name;
  final double rate;

  Currency({
    required this.id,
    required this.date,
    required this.abbreviation,
    required this.scale,
    required this.name,
    required this.rate
  });

  factory Currency.fromJson(Map<String, dynamic> map) {
    var costyl = map['Date'].split('T');
    var costyl1 = costyl[0].split('-');
    String parsedDateString = '${costyl1[2]}.${costyl1[1]}.${costyl1[0]}';
    return Currency(
      id: map['Cur_ID'],
      date: parsedDateString,
      abbreviation: map['Cur_Abbreviation'],
      scale: map['Cur_Scale'],
      name: map['Cur_Name'],
      rate: map['Cur_OfficialRate'],
    );
  }
}