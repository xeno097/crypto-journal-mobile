import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class IHoldingRepository {
  Future<Either<BaseError, List<HoldingDto>>> getHoldings({
    required GetHoldingsDto getHoldingsDto,
  });
}
