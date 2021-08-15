// Mocks generated by Mockito 5.0.11 from annotations
// in crypto_journal_mobile/test/app/transaction/service/services/transaction_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart'
    as _i7;
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart'
    as _i6;
import 'package:crypto_journal_mobile/app/transaction/service/repositories/transaction_repository.dart'
    as _i3;
import 'package:crypto_journal_mobile/shared/errors/base_error.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {
  @override
  String toString() => super.toString();
}

/// A class which mocks [ITransactionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockITransactionRepository extends _i1.Mock
    implements _i3.ITransactionRepository {
  MockITransactionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.BaseError, List<_i6.TransactionDto>>>
      getTransactions() => (super.noSuchMethod(
          Invocation.method(#getTransactions, []),
          returnValue: Future<
                  _i2.Either<_i5.BaseError, List<_i6.TransactionDto>>>.value(
              _FakeEither<_i5.BaseError, List<_i6.TransactionDto>>())) as _i4
          .Future<_i2.Either<_i5.BaseError, List<_i6.TransactionDto>>>);
  @override
  _i4.Future<_i2.Either<_i5.BaseError, _i6.TransactionDto>> createTransaction(
          _i7.CreateTransactionDto? createTransactionDto) =>
      (super.noSuchMethod(
              Invocation.method(#createTransaction, [createTransactionDto]),
              returnValue:
                  Future<_i2.Either<_i5.BaseError, _i6.TransactionDto>>.value(
                      _FakeEither<_i5.BaseError, _i6.TransactionDto>()))
          as _i4.Future<_i2.Either<_i5.BaseError, _i6.TransactionDto>>);
}