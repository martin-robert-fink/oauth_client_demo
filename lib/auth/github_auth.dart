import './social_auth.dart';

class GithubAuth extends SocialAuth {
  @override
  String get issuer => 'github';

  @override
  Future<String> authUrl() async {
    return await super.authUrl() + '&access_type=offline' + '&prompt=consent';
  }
}
