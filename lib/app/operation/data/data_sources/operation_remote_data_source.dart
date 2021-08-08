import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/operation/queries.dart';

abstract class IOperationRemoteDataSource {
  Future<List<OperationModel>> getOperations();
}

class OperationRemoteDataSource implements IOperationRemoteDataSource {
  final IGraphqlClient graphqlAuthClient;

  OperationRemoteDataSource({
    required this.graphqlAuthClient,
  });

  @override
  Future<List<OperationModel>> getOperations() async {
    final List res = await this.graphqlAuthClient.query(
          query: GET_OPERATIONS_QUERY,
          dataKey: GET_OPERATIONS_DATA_KEY,
        );

    final ret =
        res.map((operation) => OperationModel.fromJson(operation)).toList();

    return ret;
  }
}
