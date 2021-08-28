import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';

class BalanceModel extends BalanceDto {
  BalanceModel({
    required id,
    required balance,
    required cryptoCurrency,
    required cryptoValue,
  }) : super(
          id: id,
          balance: balance,
          cryptoCurrency: cryptoCurrency,
          cryptoValue: cryptoValue,
        );

  factory BalanceModel.fromJson(Map<String, dynamic> jsonMap) {
    return BalanceModel(
      id: jsonMap["id"],
      balance: num.parse(jsonMap["balance"].toString()).toDouble(),
      cryptoCurrency: jsonMap["cryptoCurrency"],
      cryptoValue: num.parse(jsonMap["cryptoValue"].toString()).toDouble(),
    );
  }
}
