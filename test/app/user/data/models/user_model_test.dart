import 'dart:convert';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import "package:flutter_test/flutter_test.dart";
import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final userModel = UserModel(
    id: "1234567890",
    userName: "test user",
    profilePicture: "http//:google.com",
    email: "test@email.com",
  );

  final userModelWithMissingEmail = UserModel(
    id: "1234567890",
    profilePicture: "http//:google.com",
    userName: "test user",
    email: "",
  );

  group('UserModel', () {
    test('it should be an instance of UserDto', () {
      expect(userModel, isA<UserDto>());
    });
  });

  group('fromJson', () {
    test('it should return a valid UserModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("user_fixture.json"));

      // act
      final res = UserModel.fromJson(jsonMap);

      // assert
      expect(res, userModel);
    });

    test(
        "it should return a valid user model when a valid json is provided with one a missing email ",
        () {
      // arrange

      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("user_with_missing_email_fixture.json"));

      // act
      final res = UserModel.fromJson(jsonMap);

      // assert
      expect(res, userModelWithMissingEmail);
    });
  });
}
