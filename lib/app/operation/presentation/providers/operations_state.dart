import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';

abstract class OperationsState {}

class InitialOperationsState extends OperationsState {}

class LoadingOperationsState extends OperationsState {}

class LoadedOperationsState extends OperationsState {
  final List<OperationDto> operations;

  LoadedOperationsState({
    required this.operations,
  });
}

class ErrorOperationsState extends OperationsState {}
