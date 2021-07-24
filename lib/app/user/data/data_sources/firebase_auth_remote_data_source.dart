import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthRemoteDataSource {
  FirebaseAuth get instace;
  Future<String> getUserToken(AuthCredential credential);
}

class FirebaseAuthRemoteDataSource implements IFirebaseAuthRemoteDataSource {
  @override
  Future<String> getUserToken(AuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);

    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw UnauthorizedUserException();
    }

    final userToken = await user.getIdToken();

    return userToken;
  }

  @override
  FirebaseAuth get instace => FirebaseAuth.instance;
}
