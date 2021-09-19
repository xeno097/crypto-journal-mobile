import 'package:crypto_journal_mobile/app/transaction/data/data_sources/transaction_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/create_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/get_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/delete_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionRepositoryProvider = FutureProvider<TransactionRepository>((
  ProviderReference ref,
) async {
  final networkInfo = ref.read(networkInfoProvider);
  final transactionRemoteDataSource = await ref.read(
    transactionRemoteDataSourceProvider.future,
  );

  final transactionRepository = TransactionRepository(
    networkInfo: networkInfo,
    transactionRemoteDataSource: transactionRemoteDataSource,
  );

  return transactionRepository;
});

class TransactionRepository extends BaseRepository
    implements ITransactionRepository {
  late final INetworkInfo _networkInfo;
  late final ITransactionRemoteDataSource _transactionRemoteDataSource;

  TransactionRepository({
    required networkInfo,
    required transactionRemoteDataSource,
  }) {
    this._networkInfo = networkInfo;
    this._transactionRemoteDataSource = transactionRemoteDataSource;
  }

  @override
  Future<Either<BaseError, TransactionDto>> createTransaction(
    CreateTransactionDto createTransactionDto,
  ) async {
    return await this.safeRequestHandler(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final createTransactionInput = CreateTransactionInput(
        coinSymbol: createTransactionDto.coinSymbol,
        coins: createTransactionDto.coins,
        fee: createTransactionDto.fee,
        coinPrice: createTransactionDto.coinPrice,
        date: createTransactionDto.date,
        operation: createTransactionDto.operation,
      );

      return await this
          ._transactionRemoteDataSource
          .createTransaction(createTransactionInput);
    });
  }

  @override
  Future<Either<BaseError, List<TransactionDto>>> getTransactions(
    GetTransactionsDto getTransactionsDto,
  ) async {
    return await this.safeRequestHandler(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final getTransactionsInput = GetTransactionsInput(
        start: getTransactionsDto.start,
        limit: getTransactionsDto.limit,
      );

      return await this
          ._transactionRemoteDataSource
          .getTransactions(getTransactionsInput);
    });
  }

  @override
  Future<Either<BaseError, TransactionDto>> deleteTransaction(
    DeleteTransactionDto deleteTransactionDto,
  ) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }
}
