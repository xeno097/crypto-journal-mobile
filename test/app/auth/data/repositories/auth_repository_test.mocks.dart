// Mocks generated by Mockito 5.0.11 from annotations
// in crypto_journal_mobile/test/app/auth/data/repositories/auth_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:crypto_journal_mobile/app/auth/data/data_sources/auth_remote_data_source.dart'
    as _i5;
import 'package:crypto_journal_mobile/app/auth/data/inputs/sign_in_input.dart'
    as _i6;
import 'package:crypto_journal_mobile/app/auth/data/models/auth_payload_model.dart'
    as _i2;
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAuthPayloadModel extends _i1.Fake implements _i2.AuthPayloadModel {}

/// A class which mocks [INetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkInfo extends _i1.Mock implements _i3.INetworkInfo {
  MockINetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}

/// A class which mocks [IAuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthRemoteDataSource extends _i1.Mock
    implements _i5.IAuthRemoteDataSource {
  MockIAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AuthPayloadModel> signIn(_i6.SignInInput? signInInput) =>
      (super.noSuchMethod(Invocation.method(#signIn, [signInInput]),
              returnValue:
                  Future<_i2.AuthPayloadModel>.value(_FakeAuthPayloadModel()))
          as _i4.Future<_i2.AuthPayloadModel>);
  @override
  _i4.Future<bool> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}