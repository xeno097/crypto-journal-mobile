import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:equatable/equatable.dart';

abstract class EventState extends Equatable {}

class InitialEventState extends EventState {
  @override
  List<Object?> get props => [];
}

class SuccessEventState extends EventState {
  final String message;

  @override
  List<Object?> get props => [this.message];

  SuccessEventState({
    this.message = "Success",
  });
}

class ErrorEventState extends EventState {
  final BaseError error;

  @override
  List<Object?> get props => [this.error];

  ErrorEventState({
    required this.error,
  });
}
