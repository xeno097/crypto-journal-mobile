// Mocks generated by Mockito 5.0.15 from annotations
// in crypto_journal_mobile/test/shared/data/graphql/graphql_auth_client_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart'
    as _i5;
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart'
    as _i4;
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ILocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockILocalStorage extends _i1.Mock implements _i2.ILocalStorage {
  MockILocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> setData(_i4.SetDataDto? setDataDto) =>
      (super.noSuchMethod(Invocation.method(#setData, [setDataDto]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<String> getData(_i5.GetDataDto? getDataDto) =>
      (super.noSuchMethod(Invocation.method(#getData, [getDataDto]),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
  @override
  _i3.Future<bool> removeData(_i5.GetDataDto? deleteDataDto) =>
      (super.noSuchMethod(Invocation.method(#removeData, [deleteDataDto]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  String toString() => super.toString();
}
