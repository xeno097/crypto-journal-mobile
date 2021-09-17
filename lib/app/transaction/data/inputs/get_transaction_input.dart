import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';

class GetTransactionsInput extends GetTransactionsDto {
  GetTransactionsInput({
    required int start,
    required int limit,
  }) : super(
          limit: limit,
          start: start,
        );

  Map<String, dynamic> toJson() {
    return {
      "start": this.start,
      "limit": this.limit,
    };
  }
}
