// Mocks generated by Mockito 5.0.15 from annotations
// in crypto_journal_mobile/test/app/operation/service/services/operation_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart'
    as _i6;
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart'
    as _i3;
import 'package:crypto_journal_mobile/shared/errors/base_error.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [IOperationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOperationRepository extends _i1.Mock
    implements _i3.IOperationRepository {
  MockIOperationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.BaseError, List<_i6.OperationDto>>>
      getOperations() => (super.noSuchMethod(
              Invocation.method(#getOperations, []),
              returnValue: Future<
                      _i2.Either<_i5.BaseError, List<_i6.OperationDto>>>.value(
                  _FakeEither_0<_i5.BaseError, List<_i6.OperationDto>>()))
          as _i4.Future<_i2.Either<_i5.BaseError, List<_i6.OperationDto>>>);
  @override
  String toString() => super.toString();
}
