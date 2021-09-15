import 'package:crypto_journal_mobile/app/user/service/services/user_service.dart';
import 'package:crypto_journal_mobile/shared/errors/functions/handle_error.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

enum AuthStatus {
  SignedIn,
  NotSignedIn,
}

final getLoginStatusProvider = FutureProvider.autoDispose<AuthStatus>((
  ProviderReference ref,
) async {
  final userService = await ref.read(userServiceProvider.future);

  final res = await userService.getLoggedUser();

  return res.fold(
    (err) => handleProviderErrorResult<AuthStatus>(
      ref,
      err,
      callback: () => AuthStatus.NotSignedIn,
    ),
    (data) => AuthStatus.SignedIn,
  );
});
