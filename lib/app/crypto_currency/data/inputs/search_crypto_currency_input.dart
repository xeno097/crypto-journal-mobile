import "package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart";

class SearchCryptoCurrencyInput extends SearchCryptoCurrencyDto {
  SearchCryptoCurrencyInput({
    required String text,
  }) : super(
          text: text,
        );
}
