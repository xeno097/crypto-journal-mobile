import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class OperationRepository implements IOperationRepository {
  final IOperationRemoteDataSource operationRemoteDataSource;

  OperationRepository({
    required this.operationRemoteDataSource,
  });

  @override
  Future<Either<BaseError, OperationDto>> getOperations() {
    // TODO: implement getOperations
    throw UnimplementedError();
  }
}
