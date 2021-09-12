import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IGoogleAuthDataSource {
  Future<AuthCredential> signIn();
  Future<bool> signOut();
}

class GoogleAuthDataSource implements IGoogleAuthDataSource {
  @override
  Future<AuthCredential> signIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw UnauthorizedUserException();
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return credential;
  }

  @override
  Future<bool> signOut() async {
    await GoogleSignIn().disconnect();

    return true;
  }
}
