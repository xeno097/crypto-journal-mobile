import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:equatable/equatable.dart';

class TransactionDto extends Equatable {
  final String id;
  final String coinSymbol;
  final double coins;
  final double cost;
  final double fee;
  final String date;
  final OperationDto operation;

  TransactionDto({
    required this.id,
    required this.coinSymbol,
    required this.coins,
    required this.cost,
    required this.fee,
    required this.date,
    required this.operation,
  });

  @override
  List<Object?> get props => [
        this.coinSymbol,
        this.coins,
        this.cost,
        this.date,
        this.fee,
        this.id,
        this.operation,
      ];
}
