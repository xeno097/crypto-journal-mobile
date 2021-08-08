import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

abstract class IOperationService {
  Future<Either<BaseError, List<OperationDto>>> getOperations();
}

class OperationService implements IOperationService {
  late final IOperationRepository _operationRepository;

  OperationService({
    required operationRepository,
  }) {
    this._operationRepository = operationRepository;
  }

  @override
  Future<Either<BaseError, List<OperationDto>>> getOperations() async {
    return await this._operationRepository.getOperations();
  }
}
