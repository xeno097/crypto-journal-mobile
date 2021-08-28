import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class IBalanceRepository {
  Future<Either<BaseError, BalanceDto>> getBalance({
    required GetBalanceDto getBalanceDto,
  });
}
