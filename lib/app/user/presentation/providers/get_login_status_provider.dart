import 'package:crypto_journal_mobile/app/user/service/services/user_service.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final getLoginStatusProvider = FutureProvider.autoDispose<bool>((ref) async {
  final userService = await ref.read(userServiceProvider.future);

  final res = await userService.getLoggedUser();

  final bool loginStatus = res.fold(
    (err) => false,
    (data) => true,
  );

  return loginStatus;
});
