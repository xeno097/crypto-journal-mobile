import 'dart:convert';
import 'package:crypto_journal_mobile/app/user/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/data_sources/firebase_auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/data_sources/google_auth_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/auth/mutations.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../shared/fixtures/fixture_reader.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([
  ILocalStorage,
  IGraphqlClient,
  IFirebaseAuthRemoteDataSource,
  IGoogleAuthDataSource,
])
void main() {
  late MockILocalStorage localStorageMock;
  late MockIGraphqlClient graphqlAuthClientMock;
  late MockIGraphqlClient graphqlPublicClientMock;
  late MockIFirebaseAuthRemoteDataSource firebaseAuthMock;
  late MockIGoogleAuthDataSource googleAuthDataSourceMock;
  late AuthRemoteDataSource authRemoteDataSource;

  final AuthCredential credential = AuthCredential(
    providerId: "google.com",
    signInMethod: "emailLink",
  );

  final authPayloadJson =
      json.decode(fixtureReader("auth_payload_fixture.json"));

  final fakeToken = "fake-firebase-token";

  final signInvariables = {
    "input": fakeToken,
  };

  final AuthPayloadModel authPayloadModel =
      AuthPayloadModel.fromJson(authPayloadJson);

  final deleteAccessTokenDto = GetDataDto(key: ACCESS_TOKEN_KEY);
  final deleteRefreshTokenDto = GetDataDto(key: REFRESH_TOKEN_KEY);

  setUp(() {
    localStorageMock = MockILocalStorage();
    graphqlAuthClientMock = MockIGraphqlClient();
    graphqlPublicClientMock = MockIGraphqlClient();
    firebaseAuthMock = MockIFirebaseAuthRemoteDataSource();
    googleAuthDataSourceMock = MockIGoogleAuthDataSource();
    authRemoteDataSource = AuthRemoteDataSource(
      localStorage: localStorageMock,
      firebaseAuthRemoteDataSource: firebaseAuthMock,
      googleAuthDataSource: googleAuthDataSourceMock,
      graphqlAuthClient: graphqlAuthClientMock,
      graphqlPublicClient: graphqlPublicClientMock,
    );
  });

  group("AuthRemoteDataSource", () {
    test('should be an instance of IAuthRemoteDataSource', () {
      // assert
      expect(authRemoteDataSource, isA<IAuthRemoteDataSource>());
    });
  });

  group("AuthRemoteDataSource.signIn", () {
    setSuccessMocks() {
      when(googleAuthDataSourceMock.signIn())
          .thenAnswer((_) => Future.value(credential));
      when(firebaseAuthMock.getUserToken(any))
          .thenAnswer((_) => Future.value(fakeToken));
      when(graphqlPublicClientMock.mutate(
              dataKey: anyNamed('dataKey'),
              mutation: anyNamed('mutation'),
              variables: anyNamed('variables')))
          .thenAnswer((_) => Future.value(authPayloadJson));
    }

    test('should call the signIn method of the IGoogleAuthDataSource class',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(SIGN_IN_PROVIDER.GOOGLE);

      // assert
      verify(googleAuthDataSourceMock.signIn());
    });

    test(
        'should call the getUserToken method of the IFirebaseAuthRemoteDataSource class',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(SIGN_IN_PROVIDER.GOOGLE);

      // assert
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
    });

    test('should call the mutate method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(SIGN_IN_PROVIDER.GOOGLE);

      // assert
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
    });

    test('should return the logged in user authPayload', () async {
      // arrange
      setSuccessMocks();

      // act
      final res = await authRemoteDataSource.signIn(SIGN_IN_PROVIDER.GOOGLE);

      // assert
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));

      expect(res, equals(authPayloadModel));
    });
  });

  group("AuthRemoteDataSource.signOut", () {
    setSuccessMock() {
      when(firebaseAuthMock.signOut()).thenAnswer((_) => Future.value());
      when(localStorageMock.removeData(any))
          .thenAnswer((_) => Future.value(true));
    }

    test(
        'should call the signOut method of the IFirebaseAuthRemoteDataSource class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
    });

    test(
        'should call the removeData method of the ILocalStorage class to remove ACCESS_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
    });

    test(
        'should call the removeData method of the ILocalStorage class to remove REFRESH_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
    });

    test('should return true if successfully signs the user out', () async {
      // arrange
      setSuccessMock();

      // act
      final res = await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));

      expect(res, true);
    });
  });
}
