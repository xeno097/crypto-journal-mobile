import 'package:crypto_journal_mobile/app/operation/data/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IOperationService {
  Future<Either<BaseError, List<OperationDto>>> getOperations();
}

final operationServiceProvider =
    FutureProvider<OperationService>((ProviderReference ref) async {
  final operationRepository =
      await ref.read(operationRepositoryProvider.future);

  final operationService =
      OperationService(operationRepository: operationRepository);

  return operationService;
});

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
