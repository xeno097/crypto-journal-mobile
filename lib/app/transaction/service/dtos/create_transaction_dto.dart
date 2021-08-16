import 'package:equatable/equatable.dart';

class CreateTransactionDto extends Equatable {
  final String coinSymbol;
  final double coins;
  final double fee;
  final double coinPrice;
  final String date;
  final String operation;

  CreateTransactionDto({
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
}
