import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import './user.dart';

import '../l10n/generated/l10n.dart';

import '../constants/auth.dart' as ac;
import '../constants/keys.dart' as kc;
import '../constants/general.dart' as gc;

abstract class SocialAuth {
  final String _state = Uuid().v4();
  late Timer _timer;

  final Duration _connectTimeoutDuration = const Duration(seconds: 10);
  final Duration _authTimeoutDuration = const Duration(seconds: 300);

  String get issuer;

  Future<void> authenticate() async {
    try {
      final webSocket = await _connectSocket();
      webSocket.add(json.encode({kc.STATE: _state}));
      _timer = Timer(_authTimeoutDuration, () => _onAuthtimeout(webSocket));
      _authCompleteListener(webSocket);
      _launchAuthUrl();
    } catch (error) {
      Get.snackbar(
        L10N.current.authenticationFailed,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<WebSocket> _connectSocket() async {
    final webSocket = await WebSocket.connect(ac.SOCKET_ENDPOINT).timeout(
        _connectTimeoutDuration,
        onTimeout: () => throw Exception(L10N.current.timeoutAuthServer));
    return webSocket;
  }

  void _onAuthtimeout(WebSocket webSocket) async {
    await webSocket.close(WebSocketStatus.normalClosure);
    _timer.cancel();
    Get.snackbar(
      L10N.current.timeoutTokenWait,
      L10N.current.timeoutTokenWait,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _authCompleteListener(WebSocket webSocket) {
    webSocket.listen((tokenData) {
      if ((jsonDecode(tokenData)).containsKey(kc.ERROR)) {
        Get.snackbar(
          L10N.current.authenticationFailed,
          jsonDecode(tokenData)[kc.ERROR],
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        User.login(tokenData);
      }
    },
        onDone: () => _timer.cancel(),
        onError: (error) =>
            throw Exception(L10N.current.noTokenData + error.toString()));
  }

  Future<void> _launchAuthUrl() async {
    await launch(
      await authUrl(),
      forceSafariVC: false,
      forceWebView: false,
    ).catchError((error) => throw Exception(L10N.current.noAuthUrl));
  }

  Future<String> authUrl() async {
    String clientId;
    try {
      clientId = await _getClientId();
      return ac.AUTH_ENDPOINTS[issuer]! +
          '?response_type=code' +
          '&client_id=$clientId' +
          '&redirect_uri=${ac.AUTH_REDIRECT_URI[issuer]}' +
          '&state=$_state' +
          '&scope=${ac.AUTH_SCOPE[issuer]}';
    } catch (error) {
      rethrow;
    }
  }

  Future<String> _getClientId() async {
    final response = await Client().get(
      Uri.parse(gc.HTTPS_SCHEME + ac.AUTH_ENDPOINT + gc.CLIENT_ID_API_CALL),
      headers: {kc.ISSUER: issuer},
    );
    return (response.headers.containsKey(kc.CLIENT_ID))
        ? response.headers[kc.CLIENT_ID]!
        : throw Exception(L10N.current.noClientId);
  }
}
