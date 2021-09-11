import 'dart:convert';
import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/graphql/mutations.dart';
import 'package:crypto_journal_mobile/app/user/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../shared/fixtures/fixture_reader.dart';
import 'user_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlClient;
  late UserRemoteDataSource userRemoteDataSource;

  final userJson = json.decode(fixtureReader("user/user_fixture.json"));
  final userModel = UserModel.fromJson(userJson);

  final updateUserInput = UpdateUserInput();

  setUp(() {
    graphqlClient = MockIGraphqlClient();
    userRemoteDataSource = UserRemoteDataSource(
      graphqlAuthClient: graphqlClient,
    );
  });

  group("UserRemoteDataSource", () {
    test('should be an instance of IUserRemoteDataSource', () {
      // assert
      expect(userRemoteDataSource, isA<IUserRemoteDataSource>());
    });
  });

  group("UserRemoteDataSource.getUser", () {
    setSuccessMock() {
      when(graphqlClient.query(
        dataKey: anyNamed("dataKey"),
        query: anyNamed("query"),
        variables: anyNamed("variables"),
      )).thenAnswer((_) => Future.value(userJson));
    }

    test('should call the query method of the IGraphqlClient', () async {
      // arrange
      setSuccessMock();

      // act
      await userRemoteDataSource.getUser();

      // assert
      verify(graphqlClient.query(
          dataKey: GET_LOGGED_USER_QUERY_DATA_KEY,
          query: GET_LOGGED_USER_QUERY));
    });

    test('should return the logged user', () async {
      // arrange
      setSuccessMock();

      // act
      final res = await userRemoteDataSource.getUser();

      // assert
      verify(graphqlClient.query(
          dataKey: GET_LOGGED_USER_QUERY_DATA_KEY,
          query: GET_LOGGED_USER_QUERY));
      expect(res, userModel);
    });
  });

  group('UserRemoteDataSource.updateUser', () {
    setSuccessMock() {
      when(graphqlClient.mutate(
        dataKey: anyNamed("dataKey"),
        mutation: anyNamed("mutation"),
        variables: anyNamed("variables"),
      )).thenAnswer((_) => Future.value(userJson));
    }

    test('should call the mutate method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMock();

      // act
      await userRemoteDataSource.updateUser(updateUserInput);

      // assert
      verify(graphqlClient.mutate(
        dataKey: UPDATE_LOGGED_USER_MUTATION_DATA_KEY,
        mutation: UPDATE_LOGGED_USER_MUTATION,
        variables: {"input": updateUserInput.toJson()},
      ));
    });

    test('should return the update user', () async {
      // arrange
      setSuccessMock();

      // act
      final res = await userRemoteDataSource.updateUser(updateUserInput);

      // assert
      verify(graphqlClient.mutate(
        dataKey: UPDATE_LOGGED_USER_MUTATION_DATA_KEY,
        mutation: UPDATE_LOGGED_USER_MUTATION,
        variables: {"input": updateUserInput.toJson()},
      ));
      expect(res, userModel);
    });
  });
}
