import 'package:crypto_journal_mobile/app/transaction/service/dtos/delete_transaction_dto.dart';

class DeleteTransactionInput extends DeleteTransactionDto {
  DeleteTransactionInput({
    required String id,
  }) : super(
          id: id,
        );
}
