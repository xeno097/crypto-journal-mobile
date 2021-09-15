import 'package:crypto_journal_mobile/app/balance/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_auth_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IBalanceRemoteDataSource {
  Future<BalanceModel> getBalance(
    GetBalanceInput getBalanceInput,
  );
}

final balanceRemoteDataSourceProvider =
    FutureProvider<BalanceRemoteDataSource>((
  ProviderReference ref,
) async {
  final graphqlAuthClient = await ref.read(
    graphqlAuthClientProvider.future,
  );

  final balanceRemoteDataSource = BalanceRemoteDataSource(
    graphqlAuthClient: graphqlAuthClient,
  );

  return balanceRemoteDataSource;
});

class BalanceRemoteDataSource implements IBalanceRemoteDataSource {
  final IGraphqlClient _graphqlAuthClient;

  BalanceRemoteDataSource({
    required IGraphqlClient graphqlAuthClient,
  }) : this._graphqlAuthClient = graphqlAuthClient;

  @override
  Future<BalanceModel> getBalance(
    GetBalanceInput getBalanceInput,
  ) async {
    final res = await this._graphqlAuthClient.query(
          query: GET_SELF_BALANCE_QUERY,
          dataKey: GET_SELF_BALANCE_DATA_KEY,
        );

    final ret = BalanceModel.fromJson(res);

    return ret;
  }
}
