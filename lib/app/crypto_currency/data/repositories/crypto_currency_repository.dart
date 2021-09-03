import 'package:crypto_journal_mobile/app/crypto_currency/data/data_sources/crypto_currency_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/inputs/search_crypto_currency_input.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/repositories/crypto_currency_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class CryptoCurrencyRepository implements ICryptoCurrencyRepository {
  final ICryptoCurrencyRemoteDataSource _cryptoCurrencyRemoteDataSource;
  final INetworkInfo _networkInfo;

  CryptoCurrencyRepository({
    required INetworkInfo networkInfo,
    required ICryptoCurrencyRemoteDataSource cryptoCurrencyRemoteDataSource,
  })  : this._cryptoCurrencyRemoteDataSource = cryptoCurrencyRemoteDataSource,
        this._networkInfo = networkInfo;

  @override
  Future<Either<BaseError, List<CryptoCurrencyDto>>> searchCryptoCurrency({
    required SearchCryptoCurrencyDto searchCryptoCurrencyDto,
  }) async {
    try {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final searchCryptoCurrencyInput = SearchCryptoCurrencyInput(
        text: searchCryptoCurrencyDto.text,
      );

      final List<CryptoCurrencyDto> cryptoCurrencies =
          await this._cryptoCurrencyRemoteDataSource.searchCryptoCurrency(
                searchCryptoCurrencyInput: searchCryptoCurrencyInput,
              );

      return Right(cryptoCurrencies);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
