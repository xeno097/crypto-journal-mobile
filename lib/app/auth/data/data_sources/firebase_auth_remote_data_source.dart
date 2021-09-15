import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/firebase/user_already_exist_with_another_provider_execption.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthRemoteDataSource {
  FirebaseAuth get instance;
  Future<String> getUserToken(AuthCredential credential);
  Future<void> signOut();
}

class FirebaseAuthRemoteDataSource implements IFirebaseAuthRemoteDataSource {
  @override
  Future<String> getUserToken(AuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw UnauthorizedUserException();
      }

      final userToken = await user.getIdToken();

      return userToken;
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        throw UserAlreadyExistsWithAnotherSignInProviderException();
      }
      throw Exception();
    }
  }

  @override
  FirebaseAuth get instance => FirebaseAuth.instance;

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
