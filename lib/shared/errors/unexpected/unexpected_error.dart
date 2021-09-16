import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

const String UNEXPECTED_ERROR_MESSAGE = "An unexpected error occurred";

class UnexpectedError extends BaseError {
  UnexpectedError()
      : super(
          message: UNEXPECTED_ERROR_MESSAGE,
        );

  @override
  List<Object?> get props => [];
}
