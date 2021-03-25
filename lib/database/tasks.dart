import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../l10n/generated/l10n.dart';

import '../model/task.dart';
import '../auth/token.dart';
import '../auth/user.dart';

import '../constants/keys.dart' as kc;
import '../constants/auth.dart' as ac;

class TasksDb {
  static Future<List<Task>> getAll({http.Client? client}) async {
    client ??= http.Client();
    final apiEndpoint = '${ac.API_ENDPOINT}/task/getall';
    var response = await client.get(
      Uri.parse(apiEndpoint),
      headers: {
        kc.AUTHORIZATION: ac.BEARER + await Token.idToken,
        kc.ISSUER: await Token.issuer,
      },
    ).catchError((error) => throw Exception(error.toString()));
    checkResponse(response);
    var taskList = (jsonDecode(response.body) as List)
        .map((task) => Task.fromJson(task))
        .toList();
    return taskList;
  }

  static Future<int> add(Task task, {http.Client? client}) async {
    client ??= http.Client();
    final apiEndpoint = '${ac.API_ENDPOINT}/add';
    var response = await client
        .post(
          Uri.parse(apiEndpoint),
          headers: {
            kc.AUTHORIZATION: ac.BEARER + await Token.idToken,
            kc.ISSUER: await Token.issuer,
          },
          body: jsonEncode(task.toJson()),
        )
        .catchError((error) => throw Exception(error.toString()));
    checkResponse(response);
    if (response.statusCode != HttpStatus.created)
      throw Exception(response.body);
    return response.statusCode;
  }

  static Future<void> delete(Task task, {http.Client? client}) async {
    client ??= http.Client();
    final apiEndpoint = '${ac.API_ENDPOINT}/task?id=${task.id}';
    var response = await client.delete(
      Uri.parse(apiEndpoint),
      headers: {
        kc.AUTHORIZATION: ac.BEARER + await Token.idToken,
        kc.ISSUER: await Token.issuer,
      },
    ).catchError((error) => throw Exception(error.toString()));
    checkResponse(response);
  }

  static Future<int> count({http.Client? client}) async {
    client ??= http.Client();
    final apiEndpoint = '${ac.API_ENDPOINT}/task/count';
    var response = await client.get(
      Uri.parse(apiEndpoint),
      headers: {
        kc.AUTHORIZATION: ac.BEARER + await Token.idToken,
        kc.ISSUER: await Token.issuer,
      },
    ).catchError((error) => throw Exception(error.toString()));
    checkResponse(response);
    return int.parse(response.body);
  }

  static Future<void> checkResponse(http.Response response) async {
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) return;
    (response.statusCode == HttpStatus.unauthorized)
        ? await User.logout()
        : Get.snackbar(
            L10N.current.errorGettingTaskData,
            L10N.current.errorTaskStatus(response.statusCode, response.body),
            duration: Duration(seconds: 15),
            snackPosition: SnackPosition.BOTTOM,
          );
  }
}
