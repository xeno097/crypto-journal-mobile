import 'package:crypto_journal_mobile/shared/errors/api_error/api_error.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/firebase/user_already_exist_with_another_provider_execption.dart';
import 'package:crypto_journal_mobile/shared/errors/firebase/user_already_exists_with_another_provider_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class BaseRepository {
  @protected
  Future<Either<BaseError, T>> safeRequestHandler<T>(
      Future<T> Function() action) async {
    try {
      final T res = await action();

      return Right(res);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } on UnauthorizedUserException {
      return Left(UnauthorizedUserError());
    } on UserAlreadyExistsWithAnotherSignInProviderException {
      return Left(UserAlreadyExistsWithAnotherSignInProviderError());
    } on BlockedUserException {
      return Left(BlockedUserError());
    } on EntityNotFoundException {
      return Left(EntityNotFoundError());
    } on ExpiredSessionException {
      return Left(UnauthorizedUserError());
    } on InvalidUserInputException {
      return Left(InvalidUserInputError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
