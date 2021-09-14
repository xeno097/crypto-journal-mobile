import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

abstract class EventState {}

class InitialEventState extends EventState {}

class SuccessEventState extends EventState {
  final String message;

  SuccessEventState({
    this.message = "Success",
  });
}

class ErrorEventState extends EventState {
  final BaseError error;

  ErrorEventState({
    required this.error,
  });
}
