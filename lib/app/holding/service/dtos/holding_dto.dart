import 'package:equatable/equatable.dart';

class HoldingDto extends Equatable {
  final String id;
  final double holding;
  final String symbol;
  final String name;
  final String? icon;
  final double value;
  final double price;

  HoldingDto({
    this.icon,
    required this.id,
    required this.holding,
    required this.symbol,
    required this.name,
    required this.value,
    required this.price,
  });

  @override
  List<Object?> get props => [
        this.icon,
        this.id,
        this.holding,
        this.symbol,
        this.name,
        this.value,
        this.price,
      ];
}
