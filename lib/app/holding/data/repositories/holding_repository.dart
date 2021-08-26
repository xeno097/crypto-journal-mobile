import 'package:crypto_journal_mobile/app/holding/data/data_sources/holding_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/holding/data/inputs/get_holding_input.dart';
import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/repositories/holding_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class HoldingRepository implements IHoldingRepository {
  final INetworkInfo _networkInfo;
  final IHoldingRemoteDataSource _holdingRemoteDataSource;

  HoldingRepository({
    required networkInfo,
    required holdingRemoteDataSource,
  })  : this._networkInfo = networkInfo,
        this._holdingRemoteDataSource = holdingRemoteDataSource;

  @override
  Future<Either<BaseError, List<HoldingDto>>> getHoldings({
    required GetHoldingsDto getHoldingsDto,
  }) async {
    try {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final List<HoldingModel> operations =
          await this._holdingRemoteDataSource.getHoldings(
                getHoldingInput: GetHoldingInput(),
              );

      return Right(operations);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
