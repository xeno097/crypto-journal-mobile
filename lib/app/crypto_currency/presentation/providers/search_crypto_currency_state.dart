import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';

abstract class SearchCryptoCurrencyState {
  final List<CryptoCurrencyDto> cryptoCurrencies;

  SearchCryptoCurrencyState({
    required this.cryptoCurrencies,
  });
}

class InitialSearchCryptoCurrencyState extends SearchCryptoCurrencyState {
  InitialSearchCryptoCurrencyState()
      : super(
          cryptoCurrencies: [],
        );
}

class LoadingSearchCryptoCurrencyState extends SearchCryptoCurrencyState {
  LoadingSearchCryptoCurrencyState()
      : super(
          cryptoCurrencies: [],
        );
}

class LoadedSearchCryptoCurrencyState extends SearchCryptoCurrencyState {
  LoadedSearchCryptoCurrencyState({
    required List<CryptoCurrencyDto> cryptoCurrencies,
  }) : super(
          cryptoCurrencies: cryptoCurrencies,
        );
}

class ErrorSearchCryptoCurrencyState extends SearchCryptoCurrencyState {
  ErrorSearchCryptoCurrencyState()
      : super(
          cryptoCurrencies: [],
        );
}
