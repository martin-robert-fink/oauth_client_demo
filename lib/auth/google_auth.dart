import './social_auth.dart';

class GoogleAuth extends SocialAuth {
  @override
  String get issuer => 'google';

  @override
  Future<String> authUrl() async {
    return await super.authUrl() + '&access_type=offline' + '&prompt=consent';
  }
}
