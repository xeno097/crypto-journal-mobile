import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:crypto_journal_mobile/shared/errors/functions/handle_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTransactionsProvider =
    FutureProvider.autoDispose<List<TransactionDto>>(
        (ProviderReference ref) async {
  final transactionService = await ref.read(transactionServiceProvider.future);

  final res = await transactionService.getTransactions();

  return res.fold(
    (err) => handleProviderErrorResult(ref, err),
    (transactions) => transactions,
  );
});
