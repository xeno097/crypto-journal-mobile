import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_public_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';

void main() {
  group('GraphqlPublicClient', () {
    test("should be an instance of GraphqlClient", () {
      // arrange
      final GraphqlPublicClient graphqlClient = GraphqlPublicClient();

      // act

      // assert
      expect(graphqlClient, isA<GraphqlClient>());
    });
  });

  group("GraphqlPublicClient.instance", () {
    test("should be an instance of GraphQLClient", () {
      // arrange
      final GraphqlPublicClient graphqlClient = GraphqlPublicClient();

      // act

      // assert
      expect(graphqlClient.instance, isA<GraphQLClient>());
    });
  });
}
