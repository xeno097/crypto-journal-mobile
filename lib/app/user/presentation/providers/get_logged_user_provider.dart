import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/services/user_service.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final getLoggedUserProvider = FutureProvider.autoDispose<UserDto>((
  ProviderReference ref,
) async {
  final userService = await ref.read(userServiceProvider.future);

  final res = await userService.getLoggedUser();

  final loggedUser = res.fold(
    (err) => throw err,
    (userDto) => userDto,
  );

  return loggedUser;
});
