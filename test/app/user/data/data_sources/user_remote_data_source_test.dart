import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlClient;
  late UserRemoteDataSource userRemoteDataSource;

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
}
