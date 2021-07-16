import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';

abstract class AuthRepository {
  Future signIn(SignInDto signInDto);
}
