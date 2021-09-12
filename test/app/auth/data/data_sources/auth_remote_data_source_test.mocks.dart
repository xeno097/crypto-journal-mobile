// Mocks generated by Mockito 5.0.11 from annotations
// in crypto_journal_mobile/test/app/auth/data/data_sources/auth_remote_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:crypto_journal_mobile/app/auth/data/data_sources/facebook_auth_data_source.dart'
    as _i11;
import 'package:crypto_journal_mobile/app/auth/data/data_sources/firebase_auth_remote_data_source.dart'
    as _i9;
import 'package:crypto_journal_mobile/app/auth/data/data_sources/google_auth_data_source.dart'
    as _i10;
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart'
    as _i8;
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart'
    as _i7;
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart'
    as _i6;
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart'
    as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:firebase_auth_platform_interface/src/auth_credential.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeFirebaseAuth extends _i1.Fake implements _i2.FirebaseAuth {
  @override
  String toString() => super.toString();
}

class _FakeAuthCredential extends _i1.Fake implements _i3.AuthCredential {
  @override
  String toString() => super.toString();
}

/// A class which mocks [ILocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockILocalStorage extends _i1.Mock implements _i4.ILocalStorage {
  MockILocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> setData(_i6.SetDataDto? setDataDto) =>
      (super.noSuchMethod(Invocation.method(#setData, [setDataDto]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<String> getData(_i7.GetDataDto? getDataDto) =>
      (super.noSuchMethod(Invocation.method(#getData, [getDataDto]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<bool> removeData(_i7.GetDataDto? deleteDataDto) =>
      (super.noSuchMethod(Invocation.method(#removeData, [deleteDataDto]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [IGraphqlClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGraphqlClient extends _i1.Mock implements _i8.IGraphqlClient {
  MockIGraphqlClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<dynamic> query(
          {String? query, String? dataKey, Map<String, dynamic>? variables}) =>
      (super.noSuchMethod(
          Invocation.method(#query, [],
              {#query: query, #dataKey: dataKey, #variables: variables}),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> mutate(
          {String? mutation,
          String? dataKey,
          Map<String, dynamic>? variables}) =>
      (super.noSuchMethod(
          Invocation.method(#mutate, [],
              {#mutation: mutation, #dataKey: dataKey, #variables: variables}),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
}

/// A class which mocks [IFirebaseAuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIFirebaseAuthRemoteDataSource extends _i1.Mock
    implements _i9.IFirebaseAuthRemoteDataSource {
  MockIFirebaseAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get instance =>
      (super.noSuchMethod(Invocation.getter(#instance),
          returnValue: _FakeFirebaseAuth()) as _i2.FirebaseAuth);
  @override
  _i5.Future<String> getUserToken(_i3.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#getUserToken, [credential]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}

/// A class which mocks [IGoogleAuthDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGoogleAuthDataSource extends _i1.Mock
    implements _i10.IGoogleAuthDataSource {
  MockIGoogleAuthDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.AuthCredential> signIn() => (super.noSuchMethod(
          Invocation.method(#signIn, []),
          returnValue: Future<_i3.AuthCredential>.value(_FakeAuthCredential()))
      as _i5.Future<_i3.AuthCredential>);
  @override
  _i5.Future<bool> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [IFacebookAuthDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIFacebookAuthDataSource extends _i1.Mock
    implements _i11.IFacebookAuthDataSource {
  MockIFacebookAuthDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.AuthCredential> signIn() => (super.noSuchMethod(
          Invocation.method(#signIn, []),
          returnValue: Future<_i3.AuthCredential>.value(_FakeAuthCredential()))
      as _i5.Future<_i3.AuthCredential>);
  @override
  _i5.Future<bool> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}