import 'package:equatable/equatable.dart';

enum OperationType {
  BUY,
  SELL,
}

class OperationDto extends Equatable {
  final String id;
  final String name;
  final String slug;
  final OperationType type;

  OperationDto({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.slug,
        this.type,
      ];
}
