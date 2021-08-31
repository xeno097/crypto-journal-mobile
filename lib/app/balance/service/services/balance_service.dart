import 'package:crypto_journal_mobile/app/balance/data/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IBalanceService {
  Future<Either<BaseError, BalanceDto>> getBalance({
    required GetBalanceDto getBalanceDto,
  });
}

final balanceServiceProvider = FutureProvider<BalanceService>((
  ProviderReference ref,
) async {
  final balanceRepository = await ref.read(balanceRepositoryProvider.future);

  final balanceService = BalanceService(
    balanceRepository: balanceRepository,
  );

  return balanceService;
});

class BalanceService implements IBalanceService {
  final IBalanceRepository _balanceRepository;

  BalanceService({
    required IBalanceRepository balanceRepository,
  }) : this._balanceRepository = balanceRepository;

  @override
  Future<Either<BaseError, BalanceDto>> getBalance({
    required GetBalanceDto getBalanceDto,
  }) async {
    return await this
        ._balanceRepository
        .getBalance(getBalanceDto: getBalanceDto);
  }
}
