import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';

class TransactionModel extends TransactionDto {
  TransactionModel({
    required String coinSymbol,
    required double coins,
    required double cost,
    required String date,
    required double fee,
    required String id,
    required OperationModel operation,
  }) : super(
          coinSymbol: coinSymbol,
          coins: coins,
          cost: cost,
          date: date,
          fee: fee,
          id: id,
          operation: operation,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> jsonMap) {
    return TransactionModel(
      coinSymbol: jsonMap["coinSymbol"],
      coins: num.parse(jsonMap["coins"].toString()).toDouble(),
      cost: num.parse(jsonMap["cost"].toString()).toDouble(),
      date: jsonMap["date"],
      fee: num.parse(jsonMap["fee"].toString()).toDouble(),
      id: jsonMap["id"],
      operation: OperationModel.fromJson(jsonMap["operation"]),
    );
  }
}
