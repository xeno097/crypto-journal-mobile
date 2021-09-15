import 'package:crypto_journal_mobile/app/crypto_currency/data/data_sources/crypto_currency_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/inputs/search_crypto_currency_input.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/repositories/crypto_currency_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoCurrencyRepositoryProvider =
    FutureProvider<CryptoCurrencyRepository>((
  ProviderReference ref,
) async {
  final networkInfo = ref.read(networkInfoProvider);
  final cryptoCurrencyRemoteDataSource = await ref.read(
    cryptoCurrencyRemoteDataSourceProvider.future,
  );

  final cryptoCurrencyRepository = CryptoCurrencyRepository(
    networkInfo: networkInfo,
    cryptoCurrencyRemoteDataSource: cryptoCurrencyRemoteDataSource,
  );

  return cryptoCurrencyRepository;
});

class CryptoCurrencyRepository extends BaseRepository
    implements ICryptoCurrencyRepository {
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
    return await this.safeRequestHandler<List<CryptoCurrencyDto>>(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final searchCryptoCurrencyInput = SearchCryptoCurrencyInput(
        text: searchCryptoCurrencyDto.text,
      );

      return await this._cryptoCurrencyRemoteDataSource.searchCryptoCurrency(
            searchCryptoCurrencyInput: searchCryptoCurrencyInput,
          );
    });
  }
}
