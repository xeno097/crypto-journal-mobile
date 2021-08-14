import 'package:crypto_journal_mobile/app/transaction/data/data_sources/transaction_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/create_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class TransactionRepository implements ITransactionRepository {
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
    try {
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

      final TransactionDto createdTransaction = await this
          ._transactionRemoteDataSource
          .createTransaction(createTransactionInput);

      return Right(createdTransaction);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }

  @override
  Future<Either<BaseError, List<TransactionDto>>> getTransactions() async {
    try {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final List<TransactionDto> transactions =
          await this._transactionRemoteDataSource.getTransactions();

      return Right(transactions);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
