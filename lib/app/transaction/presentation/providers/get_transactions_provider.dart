import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTransactionsProvider =
    FutureProvider.autoDispose<List<TransactionDto>>((
  ProviderReference ref,
) async {
  final transactionService = await ref.read(transactionServiceProvider.future);

  final res = await transactionService.getTransactions(
    GetTransactionsDto(start: 0, limit: 15),
  );

  return res.fold(
    (err) => handleProviderErrorResult(ref, err),
    (transactions) => transactions,
  );
});
