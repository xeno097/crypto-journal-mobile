import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/repositories/holding_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class IHoldingService {
  Future<Either<BaseError, List<HoldingDto>>> getHoldings({
    required GetHoldingsDto getHoldingsDto,
  });
}

class HoldingService implements IHoldingService {
  final IHoldingRepository _holdingRepository;

  HoldingService({
    required IHoldingRepository holdingRepository,
  }) : this._holdingRepository = holdingRepository;

  @override
  Future<Either<BaseError, List<HoldingDto>>> getHoldings({
    required GetHoldingsDto getHoldingsDto,
  }) async {
    return await this
        ._holdingRepository
        .getHoldings(getHoldingsDto: getHoldingsDto);
  }
}
