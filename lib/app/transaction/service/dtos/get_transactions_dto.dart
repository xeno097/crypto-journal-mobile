import 'package:equatable/equatable.dart';

class GetTransactionsDto extends Equatable {
  final int start;
  final int limit;

  GetTransactionsDto({
    required this.start,
    required this.limit,
  });

  @override
  List<Object?> get props => [
        this.start,
        this.limit,
      ];
}
