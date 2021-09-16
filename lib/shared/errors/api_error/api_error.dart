import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

const INTERNAL_SERVER_ERROR_MESSAGE = "Invalid user input";

class InternalServerError extends BaseError {
  InternalServerError()
      : super(
          message: INTERNAL_SERVER_ERROR_MESSAGE,
        );
}

const INVALID_USER_INPUT_ERROR = "Invalid user input";

class InvalidUserInputError extends BaseError {
  InvalidUserInputError()
      : super(
          message: INVALID_USER_INPUT_ERROR,
        );
}

const UNAUTHORIZED_USER_ERROR_MESSAGE = "Unauthorized user";

class UnauthorizedUserError extends BaseError {
  UnauthorizedUserError()
      : super(
          message: UNAUTHORIZED_USER_ERROR_MESSAGE,
        );
}

const BLOCKED_USER_ERROR_MESSAGE = "Blocked user";

class BlockedUserError extends BaseError {
  BlockedUserError()
      : super(
          message: BLOCKED_USER_ERROR_MESSAGE,
        );
}

const ENTITY_NOT_FOUND_ERROR = "Entity not found";

class EntityNotFoundError extends BaseError {
  EntityNotFoundError()
      : super(
          message: ENTITY_NOT_FOUND_ERROR,
        );
}
