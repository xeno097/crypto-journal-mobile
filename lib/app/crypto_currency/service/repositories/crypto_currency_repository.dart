import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class ICryptoCurrencyRepository {
  Future<Either<BaseError, List<CryptoCurrencyDto>>> searchCryptoCurrency({
    required SearchCryptoCurrencyDto searchCryptoCurrencyDto,
  });
}
