import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signOutProvider = FutureProvider<bool>((ProviderReference ref) async {
  final authService = await ref.read(authServiceProvider.future);

  final res = await authService.signOut();

  final signOutResult = res.fold(
    (err) => null,
    (r) => r,
  );

  if (signOutResult == null) {
    throw Exception();
  }

  return signOutResult;
});
