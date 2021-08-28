import 'package:equatable/equatable.dart';

class BalanceDto extends Equatable {
  final String id;
  final double balance;
  final String cryptoCurrency;
  final double cryptoValue;

  BalanceDto({
    required this.id,
    required this.balance,
    required this.cryptoCurrency,
    required this.cryptoValue,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.balance,
        this.cryptoCurrency,
        this.cryptoValue,
      ];
}
