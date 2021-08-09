import 'package:crypto_journal_mobile/app/transaction/data/inputs/create_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/data/models/transaction_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/transaction/queries.dart';

abstract class ITransactionRemoteDataSource {
  Future<List<TransactionModel>> getTransactions();
  Future<TransactionModel> createTransaction(
    CreateTransactionInput createTransactionDto,
  );
}

class TransactionRemoteDataSource implements ITransactionRemoteDataSource {
  late final IGraphqlClient _graphqlAuthClient;

  TransactionRemoteDataSource({
    required graphqlAuthClient,
  }) {
    this._graphqlAuthClient = graphqlAuthClient;
  }

  @override
  Future<TransactionModel> createTransaction(
      CreateTransactionInput createTransactionDto) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final List res = await this._graphqlAuthClient.query(
          query: GET_TRANSACTIONS_QUERY,
          dataKey: GET_TRANSACTIONS_DATA_KEY,
        );

    final ret = res
        .map((transaction) => TransactionModel.fromJson(transaction))
        .toList();

    return ret;
  }
}
