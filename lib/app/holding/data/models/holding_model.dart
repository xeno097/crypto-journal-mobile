import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';

class HoldingModel extends HoldingDto {
  HoldingModel({
    required double holding,
    required String id,
    required String name,
    required double price,
    required String symbol,
    required double value,
    String? icon,
  }) : super(
          holding: holding,
          id: id,
          name: name,
          price: price,
          symbol: symbol,
          value: value,
          icon: icon,
        );

  factory HoldingModel.fromJson(Map<String, dynamic> jsonMap) {
    return HoldingModel(
      holding: num.parse(jsonMap["holding"].toString()).toDouble(),
      id: jsonMap["id"],
      name: jsonMap["name"],
      price: num.parse(jsonMap["price"].toString()).toDouble(),
      symbol: jsonMap["symbol"],
      value: num.parse(jsonMap["value"].toString()).toDouble(),
      icon: jsonMap["icon"],
    );
  }
}
