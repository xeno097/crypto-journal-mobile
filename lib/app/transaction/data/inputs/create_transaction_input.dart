import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';

class CreateTransactionInput extends CreateTransactionDto {
  CreateTransactionInput({
    required String coinSymbol,
    required double coins,
    required double fee,
    required double coinPrice,
    required String date,
    required String operation,
  }) : super(
          coinPrice: coinPrice,
          coinSymbol: coinSymbol,
          coins: coins,
          date: date,
          fee: fee,
          operation: operation,
        );

  Map<String, dynamic> toJson() {
    return {
      "coinSymbol": this.coinSymbol,
      "coins": this.coins,
      "fee": this.fee,
      "coinPrice": this.coinPrice,
      "date": this.date,
      "operation": this.operation,
    };
  }
}
