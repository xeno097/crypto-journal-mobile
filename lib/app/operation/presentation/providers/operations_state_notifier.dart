import 'package:crypto_journal_mobile/app/operation/presentation/providers/operations_state.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/services/operation_service.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final operationsStateNotifierProvider =
    StateNotifierProvider.autoDispose<OperationsStateNotifier, OperationsState>(
  (
    ProviderReference ref,
  ) =>
      OperationsStateNotifier(
    providerReference: ref,
  ),
);

class OperationsStateNotifier extends StateNotifier<OperationsState> {
  late final ProviderReference _providerReference;
  late final IOperationService _operationService;

  OperationsStateNotifier({
    required ProviderReference providerReference,
  }) : super(InitialOperationsState()) {
    this._providerReference = providerReference;
    this._initState();
  }

  void _initState() async {
    this.state = LoadingOperationsState();

    this._operationService = await this._providerReference.read(
          operationServiceProvider.future,
        );

    final ref = await this._operationService.getOperations();

    ref.fold(
      (err) => this._setErrorState(err),
      (operations) => this._setLoggedState(operations),
    );
  }

  void _setErrorState(BaseError err) {
    handleProviderErrorResult(
      _providerReference,
      err,
      callback: () => {},
    );

    this.state = ErrorOperationsState();
  }

  void _setLoggedState(List<OperationDto> operations) {
    this.state = LoadedOperationsState(
      operations: operations,
    );
  }
}
