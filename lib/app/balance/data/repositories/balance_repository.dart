import 'package:crypto_journal_mobile/app/balance/data/data_sources/balance_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class BalanceRepository implements IBalanceRepository {
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
    try {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final BalanceModel balance =
          await this._balanceRemoteDataSource.getBalance(
                getBalanceInput: GetBalanceInput(),
              );

      return Right(balance);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
