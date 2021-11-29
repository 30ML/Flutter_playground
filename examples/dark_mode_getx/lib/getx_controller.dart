import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

RxBool isLightTheme = false.obs;
RxString screenTheme = 'system'.obs;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

saveThemeMode() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('screenTheme', isLightTheme.value);
}

getThemeMode() async {
  var _isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('screenTheme') != null ? prefs.getBool('theme') : true;
  }).obs;
  Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
}
