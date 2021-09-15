import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final operationRepositoryProvider = FutureProvider<OperationRepository>((
  ProviderReference ref,
) async {
  final networkInfo = ref.read(networkInfoProvider);
  final operationRemoteDataSource = await ref.read(
    operationRemoteDataSourceProvider.future,
  );

  final operationRepository = OperationRepository(
      operationRemoteDataSource: operationRemoteDataSource,
      networkInfo: networkInfo);

  return operationRepository;
});

class OperationRepository extends BaseRepository
    implements IOperationRepository {
  final IOperationRemoteDataSource operationRemoteDataSource;
  final INetworkInfo networkInfo;

  OperationRepository({
    required this.operationRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<BaseError, List<OperationDto>>> getOperations() async {
    return await this.safeRequestHandler(() async {
      final bool connectionStatus = await this.networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      return await this.operationRemoteDataSource.getOperations();
    });
  }
}
