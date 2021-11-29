import 'package:shared_preferences/shared_preferences.dart';

final sp = SharedPrefs();

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }
}
