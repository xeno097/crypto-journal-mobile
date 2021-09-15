// Mocks generated by Mockito 5.0.15 from annotations
// in crypto_journal_mobile/test/app/operation/data/repositories/operation_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart'
    as _i2;
import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart'
    as _i4;
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [IOperationRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOperationRemoteDataSource extends _i1.Mock
    implements _i2.IOperationRemoteDataSource {
  MockIOperationRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.OperationModel>> getOperations() => (super.noSuchMethod(
          Invocation.method(#getOperations, []),
          returnValue:
              Future<List<_i4.OperationModel>>.value(<_i4.OperationModel>[]))
      as _i3.Future<List<_i4.OperationModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [INetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkInfo extends _i1.Mock implements _i5.INetworkInfo {
  MockINetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  String toString() => super.toString();
}
