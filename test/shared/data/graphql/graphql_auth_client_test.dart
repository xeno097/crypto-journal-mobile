import 'package:crypto_journal_mobile/shared/data/graphql/graphql_auth_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'graphql_auth_client_test.mocks.dart';

@GenerateMocks([ILocalStorage])
void main() {
  late MockILocalStorage localStorageMock;

  setUp(() {
    localStorageMock = MockILocalStorage();
  });

  group('GraphqlAuthClient', () {
    test("should be an instance of GraphqlClient", () {
      // act
      final graphqlClient = GraphqlAuthClient(
        localStorage: localStorageMock,
      );

      // assert
      expect(graphqlClient, isA<IGraphqlClient>());
    });
  });
}
