import './social_auth.dart';

class AppleAuth extends SocialAuth {
  @override
  String get issuer => 'apple';

  @override
  Future<String> authUrl() async {
    return await super.authUrl() + '&response_mode=form_post';
  }
}
