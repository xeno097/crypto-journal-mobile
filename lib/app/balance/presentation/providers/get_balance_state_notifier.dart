import 'package:crypto_journal_mobile/app/balance/presentation/providers/get_balance_state.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/services/balance_service.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getBalanceStateNotifierProvider =
    StateNotifierProvider.autoDispose<GetBalanceStateNotifier, GetBalanceState>(
  (
    ProviderReference ref,
  ) =>
      GetBalanceStateNotifier(
    providerReference: ref,
  ),
);

class GetBalanceStateNotifier extends StateNotifier<GetBalanceState> {
  late final ProviderReference _providerReference;
  late final IBalanceService _balanceService;

  GetBalanceStateNotifier({
    required ProviderReference providerReference,
  }) : super(
          InitialGetBalanceState(),
        ) {
    this._providerReference = providerReference;
    this._initState();
  }

  void _initState() async {
    this._balanceService = await this._providerReference.read(
          balanceServiceProvider.future,
        );

    this.state = LoadingGetBalanceState();

    final res = await this._balanceService.getBalance(
          GetBalanceDto(),
        );

    res.fold(
      (err) => this._setErrorState(err),
      (balance) => this._setLoadedState(balance),
    );
  }

  void _setLoadedState(BalanceDto balance) async {
    this.state = LoadedGetBalanceState(
      balance: balance,
    );
  }

  void _setErrorState(BaseError err) {
    handleProviderErrorResult(
      providerReference: this._providerReference,
      error: err,
      callback: () => {},
    );

    this.state = ErrorGetBalanceState();
  }
}
