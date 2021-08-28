import 'package:crypto_journal_mobile/app/balance/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';

abstract class IBalanceRemoteDataSource {
  Future<BalanceModel> getBalance({
    required GetBalanceInput getBalanceInput,
  });
}

class BalanceRemoteDataSource implements IBalanceRemoteDataSource {
  final IGraphqlClient _graphqlAuthClient;

  BalanceRemoteDataSource({
    required IGraphqlClient graphqlAuthClient,
  }) : this._graphqlAuthClient = graphqlAuthClient;

  @override
  Future<BalanceModel> getBalance({
    required GetBalanceInput getBalanceInput,
  }) async {
    final res = await this._graphqlAuthClient.query(
          query: GET_SELF_BALANCE_QUERY,
          dataKey: GET_SELF_BALANCE_DATA_KEY,
        );

    final ret = BalanceModel.fromJson(res);

    return ret;
  }
}
