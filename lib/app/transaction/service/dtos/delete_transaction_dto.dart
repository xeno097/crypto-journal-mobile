import 'package:equatable/equatable.dart';

class DeleteTransactionDto extends Equatable {
  final String id;

  DeleteTransactionDto({
    required this.id,
  });

  @override
  List<Object?> get props => [
        this.id,
      ];
}
