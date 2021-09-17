import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

abstract class IFacebookAuthDataSource {
  Future<AuthCredential> signIn();
  Future<bool> signOut();
}

class FacebookAuthDataSource implements IFacebookAuthDataSource {
  @override
  Future<AuthCredential> signIn() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final loginToken = loginResult.accessToken?.token;

    if (loginToken == null) {
      throw UnauthorizedUserException();
    }

    final AuthCredential credential =
        FacebookAuthProvider.credential(loginToken);

    return credential;
  }

  @override
  Future<bool> signOut() async {
    await FacebookAuth.instance.logOut();

    return true;
  }
}
