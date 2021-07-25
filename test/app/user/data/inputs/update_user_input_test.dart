import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("UpdateUserInput.toJson", () {
    test('should return a json map containing the userName field', () {
      // arrange
      final userName = "test";

      final updateUserInput = UpdateUserInput(
        userName: userName,
      );

      final expectedResult = {"userName": userName};
      // act
      final res = updateUserInput.toJson();

      // assert
      expect(res, expectedResult);
    });

    test('should return a json map containing the profilePicture field', () {
      // arrange
      final profilePicture = "test";

      final updateUserInput = UpdateUserInput(
        profilePicture: profilePicture,
      );

      final expectedResult = {"profilePicture": profilePicture};
      // act
      final res = updateUserInput.toJson();

      // assert
      expect(res, expectedResult);
    });
  });
}
