import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/services/holding_service.dart';
import 'package:crypto_journal_mobile/shared/errors/functions/handle_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getHoldingsProvider = FutureProvider.autoDispose<List<HoldingDto>>((
  ProviderReference ref,
) async {
  final holdingService = await ref.read(holdingServiceProvider.future);

  final res = await holdingService.getHoldings(
    getHoldingsDto: GetHoldingsDto(),
  );

  return res.fold(
    (err) => handleProviderErrorResult(ref, err),
    (holdings) => holdings,
  );
});
