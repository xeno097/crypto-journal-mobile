import 'package:graphql/client.dart';

abstract class IGraphqlClient {
  GraphQLClient get instance;
}
