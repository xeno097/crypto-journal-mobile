import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class OperationRepository implements IOperationRepository {
  final IOperationRemoteDataSource operationRemoteDataSource;
  final INetworkInfo networkInfo;

  OperationRepository({
    required this.operationRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<BaseError, OperationDto>> getOperations() {
    // TODO: implement getOperations
    throw UnimplementedError();
  }
}
