import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class ITransactionRepository {
  Future<Either<BaseError, List<TransactionDto>>> getTransactions(
    GetTransactionsDto getTransactionsDto,
  );
  Future<Either<BaseError, TransactionDto>> createTransaction(
    CreateTransactionDto createTransactionDto,
  );
}
