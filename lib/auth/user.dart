import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/main_page.dart';
import '../pages/login_page.dart';

import './token.dart';

import '../constants/keys.dart' as kc;

class User {
  static Future<bool> get isLoggedIn async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(kc.ACCESS_TOKEN))
      print('AT: ${prefs.getString(kc.ACCESS_TOKEN)}');
    if (prefs.containsKey(kc.ID_TOKEN))
      print('IDT: ${prefs.getString(kc.ID_TOKEN)}');
    return (prefs.containsKey(kc.IS_LOGGED_IN)) ? true : false;
  }

  static Future<void> login(dynamic tokenData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(kc.IS_LOGGED_IN, true);
    await Token.saveTokenData(Map<String, dynamic>.from(jsonDecode(tokenData)));
    Get.offAll(() => MainPage());
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(kc.IS_LOGGED_IN);
    Token.clearTokenData();
    Get.offAll(() => LoginPage());
  }
}
