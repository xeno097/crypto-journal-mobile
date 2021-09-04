import 'package:equatable/equatable.dart';

class CryptoCurrencyDto extends Equatable {
  final String id;
  final String name;
  final String symbol;
  final double price;
  final String? icon;

  CryptoCurrencyDto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    this.icon,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.symbol,
        this.price,
        this.icon,
      ];
}
