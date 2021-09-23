import 'package:crypto_journal_mobile/app/holding/presentation/providers/holdings_state.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/services/holding_service.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final holdingsStateNotifierProvider =
    StateNotifierProvider.autoDispose<HoldingsStateNotifier, HoldingsState>(
  (
    ProviderReference ref,
  ) =>
      HoldingsStateNotifier(
    providerReference: ref,
  ),
);

class HoldingsStateNotifier extends StateNotifier<HoldingsState> {
  late final ProviderReference _providerReference;
  late final IHoldingService _holdingService;

  HoldingsStateNotifier({
    required ProviderReference providerReference,
  }) : super(
          InitialHoldingsState(),
        ) {
    this._providerReference = providerReference;
    this._initState();
  }

  void _initState() async {
    this._holdingService = await this._providerReference.read(
          holdingServiceProvider.future,
        );

    this.state = LoadingHoldingsState();

    final res = await this._holdingService.getHoldings(
          GetHoldingsDto(),
        );

    res.fold(
      (err) => this._setErrorState(err),
      (holdings) => this._setLoadedState(holdings),
    );
  }

  void _setLoadedState(List<HoldingDto> holdings) {
    final loadedState = LoadedHoldingsState(
      holdings: holdings,
    );

    this.state = loadedState;
  }

  void _setErrorState(BaseError err) {
    handleProviderErrorResult(
      providerReference: this._providerReference,
      error: err,
      callback: () => {},
    );

    this.state = ErrorHoldingsState();
  }
}
