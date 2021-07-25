import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

class UserService {
  final IUserRepository userRepository;

  UserService({
    required this.userRepository,
  });

  Future<Either<BaseError, UserDto>> getLoggedUser() async {
    return await this.userRepository.getUser();
  }

  Future<Either<BaseError, UserDto>> updateLoggedUser(
      UpdateUserDto updateUserDto) async {
    return await this.userRepository.updateUser(updateUserDto);
  }
}
