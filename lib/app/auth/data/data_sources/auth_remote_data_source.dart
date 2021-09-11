import 'package:crypto_journal_mobile/app/auth/data/data_sources/firebase_auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/data_sources/google_auth_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/graphql/mutations.dart';
import 'package:crypto_journal_mobile/app/auth/data/inputs/sign_in_input.dart';
import 'package:crypto_journal_mobile/app/auth/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_public_client.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IAuthRemoteDataSource {
  Future<AuthPayloadModel> signIn(SignInInput signInInput);
  Future<bool> signOut();
}

final authRemoteDataSourceProvider = FutureProvider<AuthRemoteDataSource>((
  ProviderReference ref,
) async {
  final localStorage = await ref.read(localStorageProvider.future);
  final graphqlPublicClient = ref.read(graphqlPublicClientProvider);

  final authRemoteDataSource = AuthRemoteDataSource(
    localStorage: localStorage,
    firebaseAuthRemoteDataSource: FirebaseAuthRemoteDataSource(),
    googleAuthDataSource: GoogleAuthDataSource(),
    graphqlPublicClient: graphqlPublicClient,
  );

  return authRemoteDataSource;
});

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final ILocalStorage _localStorage;
  final IGraphqlClient _graphqlPublicClient;
  final IFirebaseAuthRemoteDataSource _firebaseAuthRemoteDataSource;
  final IGoogleAuthDataSource _googleAuthDataSource;

  AuthRemoteDataSource({
    required ILocalStorage localStorage,
    required IFirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource,
    required IGoogleAuthDataSource googleAuthDataSource,
    required IGraphqlClient graphqlPublicClient,
  })  : this._localStorage = localStorage,
        this._graphqlPublicClient = graphqlPublicClient,
        this._firebaseAuthRemoteDataSource = firebaseAuthRemoteDataSource,
        this._googleAuthDataSource = googleAuthDataSource;

  @override
  Future<AuthPayloadModel> signIn(SignInInput signInInput) async {
    final userToken = await this._handleProviderSignIn(signInInput.provider);

    final res = await this._graphqlPublicClient.mutate(
      mutation: SIGN_IN_MUTATION,
      dataKey: SIGN_IN_MUTATION_DATA_KEY,
      variables: {"input": userToken},
    );

    final authPayload = AuthPayloadModel.fromJson(res);

    await this._localStorage.setData(SetDataDto(
          key: ACCESS_TOKEN_KEY,
          value: authPayload.accessToken,
        ));

    await this._localStorage.setData(SetDataDto(
          key: REFRESH_TOKEN_KEY,
          value: authPayload.refreshToken,
        ));

    return authPayload;
  }

  Future<String> _signInWithGoogle() async {
    final AuthCredential credential = await this._googleAuthDataSource.signIn();

    final userToken =
        await this._firebaseAuthRemoteDataSource.getUserToken(credential);

    return userToken;
  }

  Future<String> _handleProviderSignIn(SIGN_IN_PROVIDER provider) async {
    switch (provider) {
      case SIGN_IN_PROVIDER.GOOGLE:
        return await this._signInWithGoogle();
      default:
        return await this._signInWithGoogle();
    }
  }

  @override
  Future<bool> signOut() async {
    await this._firebaseAuthRemoteDataSource.signOut();

    final deletedAccessToken = await this._localStorage.removeData(
          GetDataDto(key: ACCESS_TOKEN_KEY),
        );

    final deletedRefreshToken = await this._localStorage.removeData(
          GetDataDto(key: REFRESH_TOKEN_KEY),
        );

    return deletedAccessToken && deletedRefreshToken;
  }
}
