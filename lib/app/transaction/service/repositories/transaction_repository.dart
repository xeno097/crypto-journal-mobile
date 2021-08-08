import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class ITransactionRepository {
  Future<Either<BaseError, TransactionDto>> getTransactions();
  Future<Either<BaseError, TransactionDto>> createTransaction(
      dynamic createTransactionDto);
}
