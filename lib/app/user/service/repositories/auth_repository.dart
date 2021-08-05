import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto);
  Future<Either<BaseError, bool>> signOut();
}
