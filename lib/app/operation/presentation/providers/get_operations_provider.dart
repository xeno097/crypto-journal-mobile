import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/services/operation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOperationsProvider = FutureProvider.autoDispose<List<OperationDto>>(
    (ProviderReference ref) async {
  final operationService = await ref.read(operationServiceProvider.future);

  final res = await operationService.getOperations();

  final operationsRes = res.fold(
    (err) => null,
    (operations) => operations,
  );

  if (operationsRes == null) {
    throw Exception();
  }

  return operationsRes;
});
