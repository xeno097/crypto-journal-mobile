import 'package:equatable/equatable.dart';

class CreateTransactionInput extends Equatable {
  final String coinSymbol;
  final double coins;
  final double fee;
  final double coinPrice;
  final String date;
  final String operation;

  CreateTransactionInput({
    required this.coinSymbol,
    required this.coins,
    required this.fee,
    required this.coinPrice,
    required this.date,
    required this.operation,
  });

  @override
  List<Object?> get props => [
        this.coinPrice,
        this.coinSymbol,
        this.coins,
        this.date,
        this.fee,
        this.operation,
      ];

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
