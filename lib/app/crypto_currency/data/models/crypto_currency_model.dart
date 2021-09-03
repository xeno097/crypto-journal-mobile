import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';

class CryptoCurrencyModel extends CryptoCurrencyDto {
  CryptoCurrencyModel({
    required String id,
    required String name,
    required String symbol,
    required double price,
    String? icon,
  }) : super(
          icon: icon,
          id: id,
          name: name,
          price: price,
          symbol: symbol,
        );

  factory CryptoCurrencyModel.fromJson(Map<String, dynamic> jsonMap) {
    return CryptoCurrencyModel(
      id: jsonMap["id"],
      name: jsonMap["name"],
      symbol: jsonMap["symbol"],
      price: num.parse(jsonMap["price"].toString()).toDouble(),
      icon: jsonMap["icon"],
    );
  }
}
