import 'package:crypto_journal_mobile/app/holding/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/holding/data/inputs/get_holding_input.dart';
import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';

abstract class IHoldingRemoteDataSource {
  Future<List<HoldingModel>> getHoldings({
    required GetHoldingInput getHoldingInput,
  });
}

class HoldingRemoteDataSource implements IHoldingRemoteDataSource {
  final IGraphqlClient _graphqlAuthClient;

  HoldingRemoteDataSource({
    required IGraphqlClient graphqlAuthClient,
  }) : this._graphqlAuthClient = graphqlAuthClient;

  @override
  Future<List<HoldingModel>> getHoldings({
    required GetHoldingInput getHoldingInput,
  }) async {
    final List res = await this._graphqlAuthClient.query(
          query: GET_SELF_HOLDINGS_QUERY,
          dataKey: GET_SELF_HOLDINGS_DATA_KEY,
        );

    final ret = res
        .map(
          (holding) => HoldingModel.fromJson(holding),
        )
        .toList();

    return ret;
  }
}
