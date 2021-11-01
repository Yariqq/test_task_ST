
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {

  void saveCurrencies(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  getCurrencies(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      return json.decode(prefs.getString(key)!);
    } catch (e) {
      print('Nothing in sharedPrefs ($e)');
      return null;
    }
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}