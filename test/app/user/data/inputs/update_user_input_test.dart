import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userName = "test";
  final profilePicture = "test";

  final updateUserNameInput = UpdateUserInput(
    userName: userName,
  );

  final updateUserProfileInput = UpdateUserInput(
    profilePicture: profilePicture,
  );

  group("UpdateUserInput", () {
    test('should be an instance of UpdateUserDto', () {
      // assert
      expect(updateUserNameInput, isA<UpdateUserDto>());
    });
  });

  group("UpdateUserInput.toJson", () {
    test('should return a json map containing the userName field', () {
      // arrange
      final expectedResult = {"userName": userName};

      // act
      final res = updateUserNameInput.toJson();

      // assert
      expect(res, expectedResult);
    });

    test('should return a json map containing the profilePicture field', () {
      // arrange
      final expectedResult = {"profilePicture": profilePicture};

      // act
      final res = updateUserProfileInput.toJson();

      // assert
      expect(res, expectedResult);
    });
  });
}
