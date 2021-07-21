// Mocks generated by Mockito 5.0.11 from annotations
// in crypto_journal_mobile/test/app/user/data/repositories/user_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart'
    as _i3;
import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart'
    as _i5;
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart'
    as _i2;
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeUserModel extends _i1.Fake implements _i2.UserModel {}

/// A class which mocks [IUserRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIUserRemoteDataSource extends _i1.Mock
    implements _i3.IUserRemoteDataSource {
  MockIUserRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> getUser() =>
      (super.noSuchMethod(Invocation.method(#getUser, []),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel()))
          as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<_i2.UserModel> updateUser(_i5.UpdateUserInput? updateUserInput) =>
      (super.noSuchMethod(Invocation.method(#updateUser, [updateUserInput]),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel()))
          as _i4.Future<_i2.UserModel>);
}

/// A class which mocks [INetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkInfo extends _i1.Mock implements _i6.INetworkInfo {
  MockINetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
