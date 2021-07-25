import 'package:crypto_journal_mobile/app/user/data/data_sources/google_auth_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/auth/mutations.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_remote_data_source.dart';

abstract class IAuthRemoteDataSource {
  Future<AuthPayloadModel> signIn(SIGN_IN_PROVIDER provider);
  Future<bool> signOut();
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final ILocalStorage localStorage;
  final IGraphqlClient graphqlAuthClient;
  final IGraphqlClient graphqlPublicClient;
  final IFirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource;
  final IGoogleAuthDataSource googleAuthDataSource;

  AuthRemoteDataSource({
    required this.localStorage,
    required this.firebaseAuthRemoteDataSource,
    required this.googleAuthDataSource,
    required this.graphqlAuthClient,
    required this.graphqlPublicClient,
  });

  @override
  Future<AuthPayloadModel> signIn(SIGN_IN_PROVIDER provider) async {
    final userToken = await this._signInWithGoogle();

    final res = await this.graphqlPublicClient.mutate(
      mutation: SIGN_IN_MUTATION,
      dataKey: SIGN_IN_MUTATION_DATA_KEY,
      variables: {"input": userToken},
    );

    return AuthPayloadModel.fromJson(res);
  }

  Future<String> _signInWithGoogle() async {
    final AuthCredential credential = await this.googleAuthDataSource.signIn();

    final userToken =
        await this.firebaseAuthRemoteDataSource.getUserToken(credential);

    return userToken;
  }

  @override
  Future<bool> signOut() async {
    await this.firebaseAuthRemoteDataSource.signOut();
    final deletedAccessToken = await this.localStorage.removeData(
          GetDataDto(key: ACCESS_TOKEN_KEY),
        );
    final deletedRefreshToken = await this.localStorage.removeData(
          GetDataDto(key: REFRESH_TOKEN_KEY),
        );

    return deletedAccessToken && deletedRefreshToken;
  }
}
