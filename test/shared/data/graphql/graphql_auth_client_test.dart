import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_auth_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'graphql_auth_client_test.mocks.dart';

@GenerateMocks([ILocalStorage])
void main() {
  late MockILocalStorage localStorageMock;
  final fakeAccessToken = "1234567890";

  setUp(() {
    localStorageMock = MockILocalStorage();
  });

  setUpMock() => when(
        localStorageMock.getData(
          any,
        ),
      ).thenAnswer(
        (_) async => Future.value(
          fakeAccessToken,
        ),
      );

  group('GraphqlAuthClient', () {
    test("should be an instance of GraphqlClient", () {
      // arrange
      setUpMock();

      // act
      final graphqlClient = GraphqlAuthClient(
        localStorage: localStorageMock,
      );

      // assert
      expect(graphqlClient, isA<IGraphqlClient>());
    });

    test("should call the getData method of the localStorage", () async {
      // arrange
      setUpMock();

      // act
      GraphqlAuthClient(
        localStorage: localStorageMock,
      );

      await untilCalled(localStorageMock.getData(any));

      // assert
      verify(
        localStorageMock.getData(
          GetDataDto(key: ACCESS_TOKEN_KEY),
        ),
      );
    });
  });

  group("GraphqlAuthClient.instance", () {
    test("should be an instance of GraphQLClient", () {
      // arrange
      setUpMock();

      // act
      final graphqlClient = GraphqlAuthClient(
        localStorage: localStorageMock,
      );

      // assert
      expect(graphqlClient.instance, isA<GraphQLClient>());
    });
  });
}
