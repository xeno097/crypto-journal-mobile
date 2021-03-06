import 'package:crypto_journal_mobile/app/transaction/presentation/providers/transaction_history_state.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/delete_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionHistoryStateNotifierProvider = StateNotifierProvider
    .autoDispose<TransactionHistoryStateNotifier, TransactionHistoryState>(
  (
    ProviderReference ref,
  ) =>
      TransactionHistoryStateNotifier(
    providerReference: ref,
  ),
);

class TransactionHistoryStateNotifier
    extends StateNotifier<TransactionHistoryState> {
  late final ProviderReference _providerReference;
  late final ITransactionService _transactionService;
  List<TransactionDto> _transactions = [];

  TransactionHistoryStateNotifier({
    required ProviderReference providerReference,
  }) : super(
          InitialTransactionHistoryState(),
        ) {
    this._providerReference = providerReference;
    this._initState();
  }

  void _initState() async {
    this._transactionService = await this._providerReference.read(
          transactionServiceProvider.future,
        );

    await this.fetchMore();
  }

  void _setLoadedState(List<TransactionDto> transactions) {
    this._transactions = transactions;

    final loadedState = LoadedTransactionHistoryState(
      transactions: this._transactions,
    );

    this.state = loadedState;
  }

  void _setErrorState(BaseError err) {
    handleProviderErrorResult(
      providerReference: this._providerReference,
      error: err,
      callback: () => {},
    );

    this.state = ErrorTransactionHistoryState(
      currentTransactions: this._transactions,
    );
  }

  Future<void> fetchMore() async {
    final start = this._transactions.length;

    this.state = LoadingTransactionHistoryState(
      currentTransactions: this._transactions,
    );

    final res = await this._transactionService.getTransactions(
          GetTransactionsDto(
            start: start,
          ),
        );

    res.fold(
      (err) => this._setErrorState(err),
      (transactions) => this._setLoadedState([
        ...this._transactions,
        ...transactions,
      ]),
    );
  }

  Future<void> deleteTransaction(String id) async {
    final res = await this._transactionService.deleteTransaction(
          DeleteTransactionDto(
            id: id,
          ),
        );

    this._transactions.removeWhere((element) => element.id == id);

    res.fold(
      (err) => handleProviderErrorResult(
        providerReference: this._providerReference,
        error: err,
        callback: () => {},
      ),
      (_) => this._setLoadedState(this._transactions),
    );
  }
}
