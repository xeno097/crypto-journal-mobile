import 'package:crypto_journal_mobile/app/transaction/service/dtos/delete_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_success_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DeleteTransactionResult {
  DeletedTransaction,
  TransactionNotDeleted,
}

final deleteTransactionProvider = FutureProvider.autoDispose
    .family<DeleteTransactionResult, DeleteTransactionDto>((
  ProviderReference ref,
  DeleteTransactionDto deleteTransactionDto,
) async {
  final transactionService = await ref.read(transactionServiceProvider.future);

  final res = await transactionService.deleteTransaction(deleteTransactionDto);

  return res.fold(
    (err) => handleProviderErrorResult<DeleteTransactionResult>(
      ref,
      err,
      callback: () => DeleteTransactionResult.TransactionNotDeleted,
    ),
    (deletedTransaction) => handleProviderSuccessResult(
      ref,
      () => DeleteTransactionResult.DeletedTransaction,
    ),
  );
});