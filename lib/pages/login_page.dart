import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth/github_auth.dart';
import '../auth/google_auth.dart';
import '../auth/apple_auth.dart';
import '../auth/facebook_auth.dart';

import '../l10n/generated/l10n.dart';

import '../constants/general.dart' as gc;

class LoginPage extends StatelessWidget {
  final _buttonSpacing = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10N.of(context).appTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SocialLoginButton(
              logo: gc.GITHUB_LOGO,
              loginText: L10N.of(context).signinWithGithub,
              onTap: () async => await GithubAuth().authenticate(),
            ),
            SizedBox(height: _buttonSpacing),
            SocialLoginButton(
              logo: gc.GOOGLE_LOGO,
              loginText: L10N.of(context).signinWithGoogle,
              onTap: () async => await GoogleAuth().authenticate(),
            ),
            SizedBox(height: _buttonSpacing),
            SocialLoginButton(
              logo: gc.FACEBOOK_LOGO,
              loginText: L10N.of(context).signinWithFacebook,
              onTap: () async => await FacebookAuth().authenticate(),
            ),
            SizedBox(height: _buttonSpacing),
            SocialLoginButton(
              logo: gc.APPLE_LOGO,
              loginText: L10N.of(context).signinWithApple,
              onTap: () async => await AppleAuth().authenticate(),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({
    required this.logo,
    required this.loginText,
    required this.onTap,
    this.logoSize = 50.0,
    this.fontSize = 16.0,
  });
  final String logo;
  final String loginText;
  final Function()? onTap;
  final double logoSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: logoSize,
                height: logoSize,
                child: SvgPicture.asset(logo),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  loginText,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.0,
                ),
              ),
            ],
          )),
    );
  }
}
