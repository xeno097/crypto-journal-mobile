import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTransactionsProvider =
    FutureProvider.autoDispose<List<TransactionDto>>(
        (ProviderReference ref) async {
  final transactionService = await ref.read(transactionServiceProvider.future);

  final res = await transactionService.getTransactions();

  final userTransactions = res.fold(
    (err) => null,
    (transactions) => transactions,
  );

  if (userTransactions == null) {
    throw Exception();
  }

  return userTransactions;
});
