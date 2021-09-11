import 'package:crypto_journal_mobile/app/user/data/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = FutureProvider<UserService>((
  ProviderReference ref,
) async {
  final userRepository = await ref.read(userRepositoryProvider.future);

  final userService = UserService(userRepository: userRepository);

  return userService;
});

class UserService {
  final IUserRepository _userRepository;

  UserService({
    required IUserRepository userRepository,
  }) : this._userRepository = userRepository;

  Future<Either<BaseError, UserDto>> getLoggedUser() async {
    return await this._userRepository.getUser();
  }

  Future<Either<BaseError, UserDto>> updateLoggedUser(
      UpdateUserDto updateUserDto) async {
    return await this._userRepository.updateUser(updateUserDto);
  }
}
