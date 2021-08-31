import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/services/balance_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getBalanceProvider = FutureProvider.autoDispose<BalanceDto>((
  ProviderReference ref,
) async {
  final balanceService = await ref.read(balanceServiceProvider.future);

  final res = await balanceService.getBalance(
    getBalanceDto: GetBalanceDto(),
  );

  final balanceDto = res.fold(
    (error) => throw error,
    (balanceDto) => balanceDto,
  );

  return balanceDto;
});
