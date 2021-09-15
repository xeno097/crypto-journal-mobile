import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/services/balance_service.dart';
import 'package:crypto_journal_mobile/shared/errors/functions/handle_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getBalanceProvider = FutureProvider.autoDispose<BalanceDto>((
  ProviderReference ref,
) async {
  final balanceService = await ref.read(
    balanceServiceProvider.future,
  );

  final res = await balanceService.getBalance(
    GetBalanceDto(),
  );

  return res.fold(
    (err) => handleProviderErrorResult(ref, err),
    (balanceDto) => balanceDto,
  );
});
