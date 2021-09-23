import 'package:crypto_journal_mobile/app/crypto_currency/presentation/providers/search_crypto_currency_state.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/services/crypto_currency_service.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchCryptoCurrencyStateNotifierProvider = StateNotifierProvider
    .autoDispose<SearchCryptoCurrencyStateNotifier, SearchCryptoCurrencyState>(
  (
    ProviderReference ref,
  ) =>
      SearchCryptoCurrencyStateNotifier(
    providerReference: ref,
  ),
);

class SearchCryptoCurrencyStateNotifier
    extends StateNotifier<SearchCryptoCurrencyState> {
  late final ProviderReference _providerReference;
  late final ICryptoCurrencyService _cryptoCurrencyService;

  SearchCryptoCurrencyStateNotifier({
    required ProviderReference providerReference,
  }) : super(
          InitialSearchCryptoCurrencyState(),
        ) {
    this._providerReference = providerReference;
    this._initState();
  }

  void _initState() async {
    this._cryptoCurrencyService = await this._providerReference.read(
          cryptoCurrencyServiceProvider.future,
        );
    this._setLoadedState([]);
  }

  void _setLoadedState(List<CryptoCurrencyDto> cryptoCurrencies) {
    final loadedState = LoadedSearchCryptoCurrencyState(
      cryptoCurrencies: cryptoCurrencies,
    );

    this.state = loadedState;
  }

  void _setErrorState(BaseError err) {
    handleProviderErrorResult(
      providerReference: this._providerReference,
      error: err,
      callback: () => {},
    );

    this.state = ErrorSearchCryptoCurrencyState();
  }

  Future<void> searchCryptoCurrency(String text) async {
    this.state = LoadingSearchCryptoCurrencyState();

    if (text.length < 2) {
      this._setLoadedState([]);
    }

    final res = await this._cryptoCurrencyService.searchCryptoCurrency(
          SearchCryptoCurrencyDto(
            text: text,
          ),
        );

    res.fold(
      (err) => this._setErrorState(err),
      (cryptoCurrencies) => this._setLoadedState(cryptoCurrencies),
    );
  }
}
