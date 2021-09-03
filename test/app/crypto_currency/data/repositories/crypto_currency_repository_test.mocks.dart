// Mocks generated by Mockito 5.0.11 from annotations
// in crypto_journal_mobile/test/app/crypto_currency/data/repositories/crypto_currency_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:crypto_journal_mobile/app/crypto_currency/data/data_sources/crypto_currency_remote_data_source.dart'
    as _i2;
import 'package:crypto_journal_mobile/app/crypto_currency/data/inputs/search_crypto_currency_input.dart'
    as _i5;
import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart'
    as _i4;
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ICryptoCurrencyRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockICryptoCurrencyRemoteDataSource extends _i1.Mock
    implements _i2.ICryptoCurrencyRemoteDataSource {
  MockICryptoCurrencyRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.CryptoCurrencyModel>> searchCryptoCurrency(
          {_i5.SearchCryptoCurrencyInput? searchCryptoCurrencyInput}) =>
      (super.noSuchMethod(
              Invocation.method(#searchCryptoCurrency, [],
                  {#searchCryptoCurrencyInput: searchCryptoCurrencyInput}),
              returnValue: Future<List<_i4.CryptoCurrencyModel>>.value(
                  <_i4.CryptoCurrencyModel>[]))
          as _i3.Future<List<_i4.CryptoCurrencyModel>>);
}

/// A class which mocks [INetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkInfo extends _i1.Mock implements _i6.INetworkInfo {
  MockINetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}
