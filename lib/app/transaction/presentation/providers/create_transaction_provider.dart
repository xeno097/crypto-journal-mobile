import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_error.dart';
import 'package:crypto_journal_mobile/shared/errors/functions/handle_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CreateTransactionResult {
  CreatedTransaction,
  TransactionNotCreated,
}

bool validateCreateTransactionDto(CreateTransactionDto createTransactionDto) {
  return (createTransactionDto.coinPrice > 0 &&
      createTransactionDto.coinSymbol.isNotEmpty &&
      createTransactionDto.coins > 0 &&
      createTransactionDto.operation.isNotEmpty);
}

final createTransactionProvider = FutureProvider.autoDispose
    .family<CreateTransactionResult, CreateTransactionDto>((
  ProviderReference ref,
  CreateTransactionDto createTransactionDto,
) async {
  final transactionService = await ref.read(transactionServiceProvider.future);

  bool check = validateCreateTransactionDto(createTransactionDto);

  if (!check) {
    return handleProviderErrorResult<CreateTransactionResult>(
      ref,
      InvalidUserInputError(),
      callback: () => CreateTransactionResult.TransactionNotCreated,
    );
  }

  final res = await transactionService.createTransaction(createTransactionDto);

  return res.fold(
    (err) => handleProviderErrorResult<CreateTransactionResult>(
      ref,
      err,
      callback: () => CreateTransactionResult.TransactionNotCreated,
    ),
    (createdTransaction) => CreateTransactionResult.CreatedTransaction,
  );
});
