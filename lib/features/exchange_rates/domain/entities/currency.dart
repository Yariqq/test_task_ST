
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'currency.g.dart';

@JsonSerializable()
class Currency extends Equatable{
  @JsonKey(name: 'Cur_ID')
  final int id;
  @JsonKey(name: 'Date')
  final String date;
  @JsonKey(name: 'Cur_Abbreviation')
  final String abbreviation;
  @JsonKey(name: 'Cur_Scale')
  final int scale;
  @JsonKey(name: 'Cur_Name')
  final String name;
  @JsonKey(name: 'Cur_OfficialRate')
  final double rate;
  bool isVisible;

  Currency({
    required this.id,
    required this.date,
    required this.abbreviation,
    required this.scale,
    required this.name,
    required this.rate,
    required this.isVisible,
  });

  factory Currency.fromJson(Map<String, dynamic> map) => _$CurrencyFromJson(map);

  @override
  List<Object?> get props => [
    id,
    date,
    abbreviation,
    scale,
    name,
    rate,
    isVisible,
  ];

}