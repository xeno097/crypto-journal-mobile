// Mocks generated by Mockito 5.0.11 from annotations
// in crypto_journal_mobile/test/app/user/data/data_sources/user_remote_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [IGraphqlClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGraphqlClient extends _i1.Mock implements _i2.IGraphqlClient {
  MockIGraphqlClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> query(
          {String? query, String? dataKey, Map<String, dynamic>? variables}) =>
      (super.noSuchMethod(
          Invocation.method(#query, [],
              {#query: query, #dataKey: dataKey, #variables: variables}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> mutate(
          {String? mutation,
          String? dataKey,
          Map<String, dynamic>? variables}) =>
      (super.noSuchMethod(
          Invocation.method(#mutate, [],
              {#mutation: mutation, #dataKey: dataKey, #variables: variables}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
}
