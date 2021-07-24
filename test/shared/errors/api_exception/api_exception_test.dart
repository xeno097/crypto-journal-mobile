import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ApiException.fromApiErrorCode", () {
    test(
        'should return BlockedUserException when the api error code is ApiErrorCodes.BLOCKED_USER',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.BLOCKED_USER);

      // assert
      expect(apiException, isA<BlockedUserException>());
    });

    test(
        'should return EntityNotFoundException when the api error code is ApiErrorCodes.ENTITY_NOT_FOUND',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.ENTITY_NOT_FOUND);

      // assert
      expect(apiException, isA<EntityNotFoundException>());
    });

    test(
        'should return ExpiredSessionException when the api error code is ApiErrorCodes.EXPIRED_JWT',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.EXPIRED_JWT);

      // assert
      expect(apiException, isA<ExpiredSessionException>());
    });

    test(
        'should return UnauthorizedUserException when the api error code is ApiErrorCodes.INVALID_JWT_FORMAT',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.INVALID_JWT_FORMAT);

      // assert
      expect(apiException, isA<UnauthorizedUserException>());
    });

    test(
        'should return UnauthorizedUserException when the api error code is ApiErrorCodes.INVALID_SIGN_IN_TOKEN',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.INVALID_SIGN_IN_TOKEN);

      // assert
      expect(apiException, isA<UnauthorizedUserException>());
    });

    test(
        'should return InvalidUserInputException when the api error code is ApiErrorCodes.INVALID_USER_INPUT',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.INVALID_USER_INPUT);

      // assert
      expect(apiException, isA<InvalidUserInputException>());
    });

    test(
        'should return UnauthorizedUserException when the api error code is ApiErrorCodes.UNAUTHORIZED_USER',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.UNAUTHORIZED_USER);

      // assert
      expect(apiException, isA<UnauthorizedUserException>());
    });

    test(
        'should return InternalServerErrorException when the api error code is ApiErrorCodes.INTERNAL_SERVER_ERROR',
        () {
      // act
      final apiException =
          ApiException.fromApiErrorCode(ApiErrorCodes.INTERNAL_SERVER_ERROR);

      // assert
      expect(apiException, isA<InternalServerErrorException>());
    });
  });
}
