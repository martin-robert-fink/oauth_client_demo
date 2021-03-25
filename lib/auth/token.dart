import 'dart:io';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:jose/jose.dart';

import './user.dart';

import '../l10n/generated/l10n.dart';

import '../constants/auth.dart' as ac;
import '../constants/keys.dart' as kc;

class Token {
  // The ID Token getter is setup this way to make it's valid
  // whenever an API call is attempted.  However, this getter
  // cannot be used within the class or an infinite loop will result.
  // Use getString from SharedPreferences to get the idToken
  // from within the class.
  static Future<String> get idToken async => await verify();

  static Future<String> get accessToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kc.ACCESS_TOKEN)!;
  }

  static Future<String> get refreshToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kc.REFRESH_TOKEN)!;
  }

  static Future<String> get issuer async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kc.ISSUER)!;
  }

  static Future<void> saveTokenData(Map<String, dynamic> tokenData) async {
    if (!tokenData.containsKey(kc.ID_TOKEN))
      throw Exception(L10N.current.noIdToken);
    await clearTokenData();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // If there's no refresh token, make the access token the refresh token
    var refreshToken = (tokenData.containsKey(kc.REFRESH_TOKEN))
        ? tokenData[kc.REFRESH_TOKEN]
        : tokenData[kc.ACCESS_TOKEN];
    await prefs.setString(kc.REFRESH_TOKEN, refreshToken);
    await prefs.setString(kc.ID_TOKEN, tokenData[kc.ID_TOKEN]);
    await prefs.setString(kc.ACCESS_TOKEN, tokenData[kc.ACCESS_TOKEN]);
    await prefs.setString(kc.ISSUER, tokenData[kc.ISSUER]);
  }

  static Future<void> clearTokenData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Windows/Linux has issues with removing keys that don't exist
    if (prefs.containsKey(kc.ID_TOKEN)) await prefs.remove(kc.ID_TOKEN);
    if (prefs.containsKey(kc.ACCESS_TOKEN)) await prefs.remove(kc.ACCESS_TOKEN);
    if (prefs.containsKey(kc.ISSUER)) await prefs.remove(kc.ISSUER);
    if (prefs.containsKey(kc.REFRESH_TOKEN))
      await prefs.remove(kc.REFRESH_TOKEN);
  }

  // The following scenarios can occur:
  // 1. ID Token is not expired and returned
  // 2. ID Token is expired, refreshed, and returned
  // 3. ID Token is expired, refresh fails, return to login screen
  static Future<String> verify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwt = JsonWebToken.unverified(prefs.getString(kc.ID_TOKEN)!);
    var claims = jwt.claims.toJson();
    var exp = DateTime.fromMillisecondsSinceEpoch(claims?[kc.EXP] * 1000);
    if (DateTime.now().isAfter(exp)) _refreshTokenData();
    return prefs.getString(kc.ID_TOKEN)!;
  }

  static Future<void> _refreshTokenData() async {
    var response = await Client().get(
      Uri.parse('${ac.REFRESH_ENDPOINT}/${await Token.issuer}'),
      headers: {
        kc.REFRESH_TOKEN: await Token.refreshToken,
        kc.ACCESS_TOKEN: await Token.accessToken
      },
    );
    (response.statusCode != HttpStatus.ok)
        ? User.logout()
        : saveTokenData(jsonDecode(response.body));
  }
}
