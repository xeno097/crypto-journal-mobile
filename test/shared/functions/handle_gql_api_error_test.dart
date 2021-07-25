import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:crypto_journal_mobile/shared/functions/handle_gql_api_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> getTestCaseInput(String code) {
    return {
      "__typename": "ApiError",
      "code": code,
    };
  }

  group('handleApiError', () {
    test(
        'should not throw an exception when the __typename property key is not ApiError',
        () {
      // arrange
      final input = {
        "__typename": "SomethingElse",
        "code": "no error",
      };

      // act
      handleGqlApiError(input);
    });

    test(
        'should throw InternalServerErrorException when the __typename property is ApiError',
        () {
      // arrange
      final input = getTestCaseInput("Anything");

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<InternalServerErrorException>()),
      );
    });

    test(
        'should throw BlockedUserException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.BLOCKED_USER',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.BLOCKED_USER);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<BlockedUserException>()),
      );
    });

    test(
        'should throw EntityNotFoundException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.ENTITY_NOT_FOUND',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.ENTITY_NOT_FOUND);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<EntityNotFoundException>()),
      );
    });

    test(
        'should throw ExpiredSessionException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.EXPIRED_JWT',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.EXPIRED_JWT);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<ExpiredSessionException>()),
      );
    });

    test(
        'should throw InternalServerErrorException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.INTERNAL_SERVER_ERROR',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.INTERNAL_SERVER_ERROR);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<InternalServerErrorException>()),
      );
    });

    test(
        'should throw UnauthorizedUserException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.INVALID_JWT_FORMAT',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.INVALID_JWT_FORMAT);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<UnauthorizedUserException>()),
      );
    });

    test(
        'should throw UnauthorizedUserException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.INVALID_SIGN_IN_TOKEN',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.INVALID_SIGN_IN_TOKEN);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<UnauthorizedUserException>()),
      );
    });

    test(
        'should throw InvalidUserInputException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.INVALID_USER_INPUT',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.INVALID_USER_INPUT);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<InvalidUserInputException>()),
      );
    });

    test(
        'should throw UnauthorizedUserException when the __typename property is ApiError and the code property is equal to ApiErrorCodes.UNAUTHORIZED_USER',
        () {
      // arrange
      final input = getTestCaseInput(ApiErrorCodes.UNAUTHORIZED_USER);

      // act & assert
      expect(
        () => handleGqlApiError(input),
        throwsA(isInstanceOf<UnauthorizedUserException>()),
      );
    });
  });
}
