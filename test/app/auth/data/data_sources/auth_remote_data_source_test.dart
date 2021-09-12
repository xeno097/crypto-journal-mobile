import 'dart:convert';
import 'package:crypto_journal_mobile/app/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/data_sources/facebook_auth_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/data_sources/firebase_auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/data_sources/google_auth_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/graphql/mutations.dart';
import 'package:crypto_journal_mobile/app/auth/data/inputs/sign_in_input.dart';
import 'package:crypto_journal_mobile/app/auth/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart';
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
  IFacebookAuthDataSource,
])
void main() {
  late MockILocalStorage localStorageMock;
  late MockIGraphqlClient graphqlPublicClientMock;
  late MockIFirebaseAuthRemoteDataSource firebaseAuthMock;
  late MockIGoogleAuthDataSource googleAuthDataSourceMock;
  late MockIFacebookAuthDataSource facebookAuthDataSource;
  late AuthRemoteDataSource authRemoteDataSource;

  final AuthCredential credential = AuthCredential(
    providerId: "google.com",
    signInMethod: "emailLink",
  );

  final authPayloadJson =
      json.decode(fixtureReader("auth/auth_payload_fixture.json"));

  final fakeToken = "fake-firebase-token";

  final signInvariables = {
    "input": fakeToken,
  };

  final AuthPayloadModel authPayloadModel =
      AuthPayloadModel.fromJson(authPayloadJson);

  setUp(() {
    localStorageMock = MockILocalStorage();
    graphqlPublicClientMock = MockIGraphqlClient();
    firebaseAuthMock = MockIFirebaseAuthRemoteDataSource();
    googleAuthDataSourceMock = MockIGoogleAuthDataSource();
    facebookAuthDataSource = MockIFacebookAuthDataSource();
    authRemoteDataSource = AuthRemoteDataSource(
      localStorage: localStorageMock,
      firebaseAuthRemoteDataSource: firebaseAuthMock,
      googleAuthDataSource: googleAuthDataSourceMock,
      graphqlPublicClient: graphqlPublicClientMock,
      facebookAuthDataSource: facebookAuthDataSource,
    );
  });

  group("AuthRemoteDataSource", () {
    test('should be an instance of IAuthRemoteDataSource', () {
      // assert
      expect(authRemoteDataSource, isA<IAuthRemoteDataSource>());
    });
  });

  group("AuthRemoteDataSource.signIn with Google", () {
    final signInWithGoogleDto = SignInInput(
      provider: SIGN_IN_PROVIDER.GOOGLE,
    );

    final signInWithGoogleProvider = SIGN_IN_PROVIDER.GOOGLE.toString();

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
      when(localStorageMock.setData(any)).thenAnswer(
        (_) => Future.value(true),
      );
    }

    test(
        'should call the setData method of the ILocalStorage class to set SIGN_IN_PROVIDER_KEY',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
    });

    test('should call the signIn method of the IGoogleAuthDataSource class',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
      verify(googleAuthDataSourceMock.signIn());
    });

    test(
        'should call the getUserToken method of the IFirebaseAuthRemoteDataSource class',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
    });

    test('should call the mutate method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
    });

    test(
        'should call the setData method of the ILocalStorage class to set ACCESS_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
      verify(localStorageMock.setData(SetDataDto(
        key: ACCESS_TOKEN_KEY,
        value: authPayloadModel.accessToken,
      )));
    });

    test(
        'should call the setData method of the ILocalStorage class to set REFRESH_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
      verify(localStorageMock.setData(SetDataDto(
        key: ACCESS_TOKEN_KEY,
        value: authPayloadModel.accessToken,
      )));
      verify(localStorageMock.setData(SetDataDto(
        key: REFRESH_TOKEN_KEY,
        value: authPayloadModel.refreshToken,
      )));
    });

    test('should return the logged in user authPayload', () async {
      // arrange
      setSuccessMocks();

      // act
      final res = await authRemoteDataSource.signIn(signInWithGoogleDto);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithGoogleProvider,
      )));
      verify(googleAuthDataSourceMock.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
      verify(localStorageMock.setData(SetDataDto(
        key: ACCESS_TOKEN_KEY,
        value: authPayloadModel.accessToken,
      )));
      verify(localStorageMock.setData(SetDataDto(
        key: REFRESH_TOKEN_KEY,
        value: authPayloadModel.refreshToken,
      )));

      expect(res, equals(authPayloadModel));
    });
  });

  group("AuthRemoteDataSource.signIn with Facebook", () {
    final signInDtoWithFacebook = SignInInput(
      provider: SIGN_IN_PROVIDER.FACEBOOK,
    );
    final signInWithFacebookProvider = SIGN_IN_PROVIDER.FACEBOOK.toString();

    setSuccessMocks() {
      when(facebookAuthDataSource.signIn())
          .thenAnswer((_) => Future.value(credential));
      when(firebaseAuthMock.getUserToken(any))
          .thenAnswer((_) => Future.value(fakeToken));
      when(graphqlPublicClientMock.mutate(
              dataKey: anyNamed('dataKey'),
              mutation: anyNamed('mutation'),
              variables: anyNamed('variables')))
          .thenAnswer((_) => Future.value(authPayloadJson));
      when(localStorageMock.setData(any)).thenAnswer(
        (_) => Future.value(true),
      );
    }

    test(
        'should call the setData method of the ILocalStorage class to set ACCESS_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
    });

    test('should call the signIn method of the IFacebookAuthDataSource class',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
      verify(facebookAuthDataSource.signIn());
    });

    test(
        'should call the getUserToken method of the IFirebaseAuthRemoteDataSource class',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
      verify(facebookAuthDataSource.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
    });

    test('should call the mutate method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
      verify(facebookAuthDataSource.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
    });

    test(
        'should call the setData method of the ILocalStorage class to set ACCESS_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
      verify(facebookAuthDataSource.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
      verify(localStorageMock.setData(SetDataDto(
        key: ACCESS_TOKEN_KEY,
        value: authPayloadModel.accessToken,
      )));
    });

    test(
        'should call the setData method of the ILocalStorage class to set REFRESH_TOKEN_KEY',
        () async {
      // arrange
      setSuccessMocks();

      // act
      await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
      verify(facebookAuthDataSource.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
      verify(localStorageMock.setData(SetDataDto(
        key: ACCESS_TOKEN_KEY,
        value: authPayloadModel.accessToken,
      )));
      verify(localStorageMock.setData(SetDataDto(
        key: REFRESH_TOKEN_KEY,
        value: authPayloadModel.refreshToken,
      )));
    });

    test('should return the logged in user authPayload', () async {
      // arrange
      setSuccessMocks();

      // act
      final res = await authRemoteDataSource.signIn(signInDtoWithFacebook);

      // assert
      verify(localStorageMock.setData(SetDataDto(
        key: SIGN_IN_PROVIDER_KEY,
        value: signInWithFacebookProvider,
      )));
      verify(facebookAuthDataSource.signIn());
      verify(firebaseAuthMock.getUserToken(credential));
      verify(graphqlPublicClientMock.mutate(
        mutation: SIGN_IN_MUTATION,
        dataKey: SIGN_IN_MUTATION_DATA_KEY,
        variables: signInvariables,
      ));
      verify(localStorageMock.setData(SetDataDto(
        key: ACCESS_TOKEN_KEY,
        value: authPayloadModel.accessToken,
      )));
      verify(localStorageMock.setData(SetDataDto(
        key: REFRESH_TOKEN_KEY,
        value: authPayloadModel.refreshToken,
      )));

      expect(res, equals(authPayloadModel));
    });
  });

  final getSignInProviderDto = GetDataDto(key: SIGN_IN_PROVIDER_KEY);
  final deleteAccessTokenDto = GetDataDto(key: ACCESS_TOKEN_KEY);
  final deleteRefreshTokenDto = GetDataDto(key: REFRESH_TOKEN_KEY);
  final deleteSignInProviderDto = GetDataDto(key: SIGN_IN_PROVIDER_KEY);

  group("AuthRemoteDataSource.signOut with Google", () {
    setSuccessMock() {
      when(firebaseAuthMock.signOut()).thenAnswer((_) => Future.value());
      when(localStorageMock.getData(any)).thenAnswer(
        (_) => Future.value(SIGN_IN_PROVIDER.GOOGLE.toString()),
      );
      when(googleAuthDataSourceMock.signOut()).thenAnswer(
        (_) => Future.value(true),
      );
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
        'should call the getData method of the ILocalStorage class to get SIGN_IN_PROVIDER_KEY',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
    });

    test('should call the signOut method of the IGoogleAuthDataSource',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(googleAuthDataSourceMock.signOut());
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
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(googleAuthDataSourceMock.signOut());
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
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(googleAuthDataSourceMock.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
    });

    test(
        'should call the removeData method of the ILocalStorage class to remove SIGN_IN_PROVIDER_KEY',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(googleAuthDataSourceMock.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
      verify(localStorageMock.removeData(deleteSignInProviderDto));
    });

    test('should return true if successfully signs the user out', () async {
      // arrange
      setSuccessMock();

      // act
      final res = await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(googleAuthDataSourceMock.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
      verify(localStorageMock.removeData(deleteSignInProviderDto));

      expect(res, true);
    });
  });

  group("AuthRemoteDataSource.signOut with Facebook", () {
    setSuccessMock() {
      when(firebaseAuthMock.signOut()).thenAnswer((_) => Future.value());
      when(localStorageMock.getData(any)).thenAnswer(
        (_) => Future.value(SIGN_IN_PROVIDER.FACEBOOK.toString()),
      );
      when(facebookAuthDataSource.signOut()).thenAnswer(
        (_) => Future.value(true),
      );
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
        'should call the getData method of the ILocalStorage class to get SIGN_IN_PROVIDER_KEY',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
    });

    test('should call the signOut method of the IFacebookAuthDataSource',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(facebookAuthDataSource.signOut());
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
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(facebookAuthDataSource.signOut());
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
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(facebookAuthDataSource.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
    });

    test(
        'should call the removeData method of the ILocalStorage class to remove SIGN_IN_PROVIDER_KEY',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(facebookAuthDataSource.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
      verify(localStorageMock.removeData(deleteSignInProviderDto));
    });

    test('should return true if successfully signs the user out', () async {
      // arrange
      setSuccessMock();

      // act
      final res = await authRemoteDataSource.signOut();

      // assert
      verify(firebaseAuthMock.signOut());
      verify(localStorageMock.getData(getSignInProviderDto));
      verify(facebookAuthDataSource.signOut());
      verify(localStorageMock.removeData(deleteAccessTokenDto));
      verify(localStorageMock.removeData(deleteRefreshTokenDto));
      verify(localStorageMock.removeData(deleteSignInProviderDto));

      expect(res, true);
    });
  });
}
