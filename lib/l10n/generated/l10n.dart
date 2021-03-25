// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class L10N {
  L10N();

  static L10N? _current;

  static L10N get current {
    assert(_current != null, 'No instance of L10N was loaded. Try to initialize the L10N delegate before accessing L10N.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<L10N> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10N();
      L10N._current = instance;
 
      return instance;
    });
  } 

  static L10N of(BuildContext context) {
    final instance = L10N.maybeOf(context);
    assert(instance != null, 'No instance of L10N present in the widget tree. Did you add L10N.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10N? maybeOf(BuildContext context) {
    return Localizations.of<L10N>(context, L10N);
  }

  /// `This is the OAuth Client Demo`
  String get appTitle {
    return Intl.message(
      'This is the OAuth Client Demo',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Signin with Facebook`
  String get signinWithFacebook {
    return Intl.message(
      'Signin with Facebook',
      name: 'signinWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Signin with Github`
  String get signinWithGithub {
    return Intl.message(
      'Signin with Github',
      name: 'signinWithGithub',
      desc: '',
      args: [],
    );
  }

  /// `Signin with Google`
  String get signinWithGoogle {
    return Intl.message(
      'Signin with Google',
      name: 'signinWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Signin with Apple`
  String get signinWithApple {
    return Intl.message(
      'Signin with Apple',
      name: 'signinWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Failed`
  String get authenticationFailed {
    return Intl.message(
      'Authentication Failed',
      name: 'authenticationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Unknown reason`
  String get unknownReason {
    return Intl.message(
      'Unknown reason',
      name: 'unknownReason',
      desc: '',
      args: [],
    );
  }

  /// `Error getting token data`
  String get noTokenData {
    return Intl.message(
      'Error getting token data',
      name: 'noTokenData',
      desc: '',
      args: [],
    );
  }

  /// `Timeout attempting to connect to authentication server`
  String get timeoutAuthServer {
    return Intl.message(
      'Timeout attempting to connect to authentication server',
      name: 'timeoutAuthServer',
      desc: '',
      args: [],
    );
  }

  /// `Timeout waiting for token`
  String get timeoutTokenWait {
    return Intl.message(
      'Timeout waiting for token',
      name: 'timeoutTokenWait',
      desc: '',
      args: [],
    );
  }

  /// `Unable to launch authentication url`
  String get noAuthUrl {
    return Intl.message(
      'Unable to launch authentication url',
      name: 'noAuthUrl',
      desc: '',
      args: [],
    );
  }

  /// `Error getting client ID from host`
  String get noClientId {
    return Intl.message(
      'Error getting client ID from host',
      name: 'noClientId',
      desc: '',
      args: [],
    );
  }

  /// `No ID Token received from host`
  String get noIdToken {
    return Intl.message(
      'No ID Token received from host',
      name: 'noIdToken',
      desc: '',
      args: [],
    );
  }

  /// `Unable to add new task`
  String get noAddTask {
    return Intl.message(
      'Unable to add new task',
      name: 'noAddTask',
      desc: '',
      args: [],
    );
  }

  /// `No Tasks`
  String get noTasks {
    return Intl.message(
      'No Tasks',
      name: 'noTasks',
      desc: '',
      args: [],
    );
  }

  /// `Unable to get taks data from server`
  String get errorGettingTaskData {
    return Intl.message(
      'Unable to get taks data from server',
      name: 'errorGettingTaskData',
      desc: '',
      args: [],
    );
  }

  /// `Status: {status}; Details: {details}`
  String errorTaskStatus(Object status, Object details) {
    return Intl.message(
      'Status: $status; Details: $details',
      name: 'errorTaskStatus',
      desc: '',
      args: [status, details],
    );
  }

  /// `Start Date: `
  String get startDate {
    return Intl.message(
      'Start Date: ',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `Due Date: `
  String get dueDate {
    return Intl.message(
      'Due Date: ',
      name: 'dueDate',
      desc: '',
      args: [],
    );
  }

  /// `Priority: `
  String get priority {
    return Intl.message(
      'Priority: ',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Complete: `
  String get complete {
    return Intl.message(
      'Complete: ',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `%`
  String get percent {
    return Intl.message(
      '%',
      name: 'percent',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Task {number}`
  String task(Object number) {
    return Intl.message(
      'Task $number',
      name: 'task',
      desc: '',
      args: [number],
    );
  }

  /// `Task detailed description {number}`
  String taskDetail(Object number) {
    return Intl.message(
      'Task detailed description $number',
      name: 'taskDetail',
      desc: '',
      args: [number],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10N> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'he'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10N> load(Locale locale) => L10N.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}