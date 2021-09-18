import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:equatable/equatable.dart';

class GetTransactionsDto extends Equatable {
  final int start;
  final int limit;

  GetTransactionsDto({
    this.start = DEFAULT_APP_PAGINATION_START,
    this.limit = DEFAULT_APP_PAGINATION_LIMIT,
  });

  @override
  List<Object?> get props => [
        this.start,
        this.limit,
      ];
}
