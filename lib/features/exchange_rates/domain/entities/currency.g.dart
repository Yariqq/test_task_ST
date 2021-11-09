// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: json['Cur_ID'] as int,
      date: json['Date'] as String,
      abbreviation: json['Cur_Abbreviation'] as String,
      scale: json['Cur_Scale'] as int,
      name: json['Cur_Name'] as String,
      rate: (json['Cur_OfficialRate'] as num).toDouble(),
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'Cur_ID': instance.id,
      'Date': instance.date,
      'Cur_Abbreviation': instance.abbreviation,
      'Cur_Scale': instance.scale,
      'Cur_Name': instance.name,
      'Cur_OfficialRate': instance.rate,
      'isVisible': instance.isVisible,
    };
