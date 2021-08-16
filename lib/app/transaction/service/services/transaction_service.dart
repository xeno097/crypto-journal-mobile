import 'package:crypto_journal_mobile/app/transaction/data/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ITransactionService {
  Future<Either<BaseError, List<TransactionDto>>> getTransactions();
  Future<Either<BaseError, TransactionDto>> createTransaction(
    CreateTransactionDto createTransactionDto,
  );
}

final transactionServiceProvider =
    FutureProvider<TransactionService>((ProviderReference ref) async {
  final transactionRepository =
      await ref.read(transactionRepositoryProvider.future);

  final transactionService =
      TransactionService(transactionRepository: transactionRepository);

  return transactionService;
});

class TransactionService implements ITransactionService {
  late final ITransactionRepository _transactionRepository;

  TransactionService({required transactionRepository}) {
    this._transactionRepository = transactionRepository;
  }

  @override
  Future<Either<BaseError, TransactionDto>> createTransaction(
      CreateTransactionDto createTransactionDto) async {
    return await this
        ._transactionRepository
        .createTransaction(createTransactionDto);
  }

  @override
  Future<Either<BaseError, List<TransactionDto>>> getTransactions() async {
    return await this._transactionRepository.getTransactions();
  }
}
