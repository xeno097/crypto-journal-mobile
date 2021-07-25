import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class IUserRepository {
  Future<Either<BaseError, UserDto>> getUser();
  Future<Either<BaseError, UserDto>> updateUser(UpdateUserDto updateUserDto);
}
