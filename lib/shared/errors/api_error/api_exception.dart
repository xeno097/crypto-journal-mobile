abstract class ApiErrorCodes {
  static const String INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR";
  static const String INVALID_USER_INPUT = "  INVALID_USER_INPUT";
  static const String INVALID_SIGN_IN_TOKEN = "  INVALID_SIGN_IN_TOKEN";
  static const String INVALID_JWT_FORMAT = "  INVALID_JWT_FORMAT";
  static const String EXPIRED_JWT = "  EXPIRED_JWT";
  static const String UNAUTHORIZED_USER = "  UNAUTHORIZED_USER";
  static const String BLOCKED_USER = "  BLOCKED_USER";
  static const String ENTITY_NOT_FOUND = "  ENTITY_NOT_FOUND";
}

abstract class ApiException {
  static Exception fromApiErrorCode(String apiErrorCode) {
    switch (apiErrorCode) {
      case ApiErrorCodes.BLOCKED_USER:
        return BlockedUserException();
      case ApiErrorCodes.ENTITY_NOT_FOUND:
        return EntityNotFoundException();
      case ApiErrorCodes.EXPIRED_JWT:
        return ExpiredSessionException();
      case ApiErrorCodes.INVALID_JWT_FORMAT:
        return UnauthorizedUserException();
      case ApiErrorCodes.INVALID_SIGN_IN_TOKEN:
        return UnauthorizedUserException();
      case ApiErrorCodes.INVALID_USER_INPUT:
        return InvalidUserInputException();
      case ApiErrorCodes.UNAUTHORIZED_USER:
        return UnauthorizedUserException();
      default:
        return InternalServerErrorException();
    }
  }
}

class InternalServerErrorException implements Exception {}

class InvalidUserInputException implements Exception {}

class UnauthorizedUserException implements Exception {}

class ExpiredSessionException implements Exception {}

class BlockedUserException implements Exception {}

class EntityNotFoundException implements Exception {}
