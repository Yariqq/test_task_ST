
import 'package:test_app_st_my/features/exchange_rates/domain/entities/currency_settings.dart';

class CurrencySettingsModel extends CurrencySettings {
  CurrencySettingsModel({
    required int id,
    required bool isVisible,
  }) : super(
    id: id,
    isVisible: isVisible,
  );

  factory CurrencySettingsModel.fromJson(Map<String, dynamic> map) {
    return CurrencySettingsModel(
      id: map['id'],
      isVisible: map['isVisible'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "isVisible": isVisible,
    };
  }
}