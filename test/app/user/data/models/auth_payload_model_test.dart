import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import "package:flutter_test/flutter_test.dart";

void main() {
  final authPayloadModel = AuthPayloadModel(
    accessToken: "1234567890",
    refreshToken: "1234567890",
    user: UserModel(
      email: "test@email.com",
      id: "1234567890",
      profilePicture: "http//:google.com",
      userName: "test",
    ),
  );

  test('it should be a subclass of UserDto', () {
    expect(authPayloadModel, isA<AuthPayloadDto>());
  });

  group('fromJson', () {
    test('it should return a valid UserModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap = {
        "accessToken": "1234567890",
        "refreshToken": "1234567890",
        "user": {
          "id": "1234567890",
          "userName": "test",
          "profilePicture": "http//:google.com",
          "email": "test@email.com",
        }
      };

      // act
      final res = AuthPayloadModel.fromJson(jsonMap);

      // assert
      expect(res, authPayloadModel);
    });
  });
}
