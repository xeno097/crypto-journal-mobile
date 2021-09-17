import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';

class SignInInput extends SignInDto {
  SignInInput({
    required SIGN_IN_PROVIDER provider,
  }) : super(
          provider: provider,
        );
}
