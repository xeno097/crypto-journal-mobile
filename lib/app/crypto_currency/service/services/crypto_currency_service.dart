import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/repositories/crypto_currency_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class ICryptoCurrencyService {
  Future<Either<BaseError, List<CryptoCurrencyDto>>> searchCryptoCurrency({
    required SearchCryptoCurrencyDto searchCryptoCurrencyDto,
  });
}

class CryptoCurrencyService implements ICryptoCurrencyService {
  final ICryptoCurrencyRepository _cryptoCurrencyRepository;

  CryptoCurrencyService({
    required ICryptoCurrencyRepository cryptoCurrencyRepository,
  }) : this._cryptoCurrencyRepository = cryptoCurrencyRepository;

  @override
  Future<Either<BaseError, List<CryptoCurrencyDto>>> searchCryptoCurrency({
    required SearchCryptoCurrencyDto searchCryptoCurrencyDto,
  }) async {
    return await this._cryptoCurrencyRepository.searchCryptoCurrency(
          searchCryptoCurrencyDto: searchCryptoCurrencyDto,
        );
  }
}
