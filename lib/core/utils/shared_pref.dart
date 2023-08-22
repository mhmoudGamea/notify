import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  final SharedPreferences _sharedPreferences = GetIt.I.get<SharedPreferences>();

  Future<bool> setData(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  bool? getData(String key) {
    return _sharedPreferences.getBool(key);
  }
}
