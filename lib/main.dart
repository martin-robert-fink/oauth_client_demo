import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'l10n/generated/l10n.dart';

import 'pages/login_page.dart';
import 'pages/main_page.dart';

import './auth/user.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(OauthClientApp());
}

// This is for Android simulator
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) =>
              true; // add your localhost detection logic here if you want
  }
}

class OauthClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        L10N.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10N.delegate.supportedLocales,
      onGenerateTitle: (context) => L10N.of(context).appTitle,
      theme: ThemeData(primarySwatch: Colors.teal),
      locale: Locale('en'),
      home: IsLoggedIn(),
    );
  }
}

class IsLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: User.isLoggedIn,
      builder: (_, snapshot) =>
          (snapshot.connectionState == ConnectionState.waiting)
              ? SizedBox()
              : (snapshot.data == true)
                  ? MainPage()
                  : LoginPage(),
    );
  }
}
