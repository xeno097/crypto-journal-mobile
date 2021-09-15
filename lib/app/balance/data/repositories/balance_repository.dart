import 'package:crypto_journal_mobile/app/balance/data/data_sources/balance_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final balanceRepositoryProvider = FutureProvider<BalanceRepository>((
  ProviderReference ref,
) async {
  final networkInfo = ref.read(networkInfoProvider);
  final balanceRemoteDataSource =
      await ref.read(balanceRemoteDataSourceProvider.future);

  final balanceRepository = BalanceRepository(
    networkInfo: networkInfo,
    balanceRemoteDataSource: balanceRemoteDataSource,
  );

  return balanceRepository;
});

class BalanceRepository extends BaseRepository implements IBalanceRepository {
  final INetworkInfo _networkInfo;
  final IBalanceRemoteDataSource _balanceRemoteDataSource;

  BalanceRepository({
    required networkInfo,
    required balanceRemoteDataSource,
  })  : this._networkInfo = networkInfo,
        this._balanceRemoteDataSource = balanceRemoteDataSource;

  @override
  Future<Either<BaseError, BalanceDto>> getBalance(
      {required GetBalanceDto getBalanceDto}) async {
    return await this.safeRequestHandler<BalanceDto>(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      return await this._balanceRemoteDataSource.getBalance(
            getBalanceInput: GetBalanceInput(),
          );
    });
  }
}
