import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:mockito/mockito.dart';
import "package:flutter_test/flutter_test.dart";

void main() {
  final userModel = UserModel(
    email: "test@email.com",
    id: "1234567890",
    profilePicture: "http//:google.com",
    userName: "test",
  );

  final userModelWithMissingEmail = UserModel(
    email: "",
    id: "1234567890",
    profilePicture: "http//:google.com",
    userName: "test",
  );

  test('it should be a subclass of UserDto', () {
    expect(userModel, isA<UserDto>());
  });

  group('fromJson', () {
    test('it should return a valid UserModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap = {
        "id": "1234567890",
        "userName": "test",
        "profilePicture": "http//:google.com",
        "email": "test@email.com",
      };

      // act
      final res = UserModel.fromJson(jsonMap);

      // assert
      expect(res, userModel);
    });

    test(
        "it should return a valid user model when a valid json is provided with one a missing email ",
        () {
      // arrange

      final Map<String, dynamic> jsonMap = {
        "id": "1234567890",
        "userName": "test",
        "profilePicture": "http//:google.com",
      };

      // act
      final res = UserModel.fromJson(jsonMap);

      // assert
      expect(res, userModelWithMissingEmail);
    });
  });
}
