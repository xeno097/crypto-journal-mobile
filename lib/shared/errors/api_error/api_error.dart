import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class InternalServerError extends BaseError {
  @override
  List<Object?> get props => [];
}

const INVALID_USER_INPUT_ERROR = "Invalid user input";

class InvalidUserInputError extends BaseError {
  @override
  List<Object?> get props => [];
}

const UNAUTHORIZED_USER_ERROR_MESSAGE = "Unauthorized user";

class UnauthorizedUserError extends BaseError {
  @override
  List<Object?> get props => [];
}

const BLOCKED_USER_ERROR_MESSAGE = "Blocked user";

class BlockedUserError extends BaseError {
  @override
  List<Object?> get props => [];
}

const ENTITY_NOT_FOUND_ERROR = "Entity not found";

class EntityNotFoundError extends BaseError {
  @override
  List<Object?> get props => [];
}
