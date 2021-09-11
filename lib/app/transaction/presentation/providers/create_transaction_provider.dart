import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool _validateCreateTransactionDto(CreateTransactionDto createTransactionDto) {
  if (createTransactionDto.coinPrice == 0) {
    return false;
  }

  if (createTransactionDto.coinSymbol.isEmpty) {
    return false;
  }

  if (createTransactionDto.coins == 0) {
    return false;
  }

  if (createTransactionDto.operation.isEmpty) {
    return false;
  }

  return true;
}

final createTransactionProvider =
    FutureProvider.autoDispose.family<TransactionDto?, CreateTransactionDto>((
  ProviderReference ref,
  CreateTransactionDto createTransactionDto,
) async {
  final check = _validateCreateTransactionDto(createTransactionDto);

  if (!check) {
    return null;
  }

  final transactionService = await ref.read(transactionServiceProvider.future);

  final res = await transactionService.createTransaction(createTransactionDto);

  final createTransactionResult = res.fold(
    (err) => null,
    (createdTransaction) => createdTransaction,
  );

  return createTransactionResult;
});
