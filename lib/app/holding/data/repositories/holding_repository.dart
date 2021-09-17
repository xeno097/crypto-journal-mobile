import 'package:crypto_journal_mobile/app/holding/data/data_sources/holding_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/holding/data/inputs/get_holding_input.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/repositories/holding_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final holdingRepositoryProvider = FutureProvider<HoldingRepository>((
  ProviderReference ref,
) async {
  final networkInfo = ref.read(networkInfoProvider);
  final holdingRemoteDataSource = await ref.read(
    holdingRemoteDataSourceProvider.future,
  );

  final holdingRepository = HoldingRepository(
    networkInfo: networkInfo,
    holdingRemoteDataSource: holdingRemoteDataSource,
  );

  return holdingRepository;
});

class HoldingRepository extends BaseRepository implements IHoldingRepository {
  final INetworkInfo _networkInfo;
  final IHoldingRemoteDataSource _holdingRemoteDataSource;

  HoldingRepository({
    required networkInfo,
    required holdingRemoteDataSource,
  })  : this._networkInfo = networkInfo,
        this._holdingRemoteDataSource = holdingRemoteDataSource;

  @override
  Future<Either<BaseError, List<HoldingDto>>> getHoldings(
    GetHoldingsDto getHoldingsDto,
  ) async {
    return await this.safeRequestHandler<List<HoldingDto>>(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      return await this._holdingRemoteDataSource.getHoldings(
            GetHoldingInput(),
          );
    });
  }
}
