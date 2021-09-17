import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

const USER_ALREADY_EXISTS_WITH_ANOTHER_PROVIDER_ERROR_MESSAGE =
    "User already exists. Sign in with the correct provider.";

class UserAlreadyExistsWithAnotherSignInProviderError extends BaseError {
  UserAlreadyExistsWithAnotherSignInProviderError()
      : super(
          message: USER_ALREADY_EXISTS_WITH_ANOTHER_PROVIDER_ERROR_MESSAGE,
        );
}
