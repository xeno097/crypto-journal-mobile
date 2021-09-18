import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';

abstract class TransactionHistoryState {
  final List<TransactionDto> transactions;

  TransactionHistoryState({
    required this.transactions,
  });
}

class InitialTransactionHistoryState extends TransactionHistoryState {
  InitialTransactionHistoryState()
      : super(
          transactions: [],
        );
}

class LoadingTransactionHistoryState extends TransactionHistoryState {
  LoadingTransactionHistoryState({
    required List<TransactionDto> currentTransactions,
  }) : super(
          transactions: currentTransactions,
        );
}

class LoadedTransactionHistoryState extends TransactionHistoryState {
  LoadedTransactionHistoryState({
    required List<TransactionDto> transactions,
  }) : super(
          transactions: transactions,
        );
}

class ErrorTransactionHistoryState extends TransactionHistoryState {
  ErrorTransactionHistoryState({
    required List<TransactionDto> currentTransactions,
  }) : super(
          transactions: currentTransactions,
        );
}
