import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';

abstract class IAuthRemoteDataSource {
  Future<AuthPayloadModel> signIn(SIGN_IN_PROVIDER provider);
  Future<bool> signOut();
}
