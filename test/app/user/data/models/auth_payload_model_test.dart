import 'dart:convert';
import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import "package:flutter_test/flutter_test.dart";
import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final authPayloadModel = AuthPayloadModel(
    accessToken: "fake-access-token",
    refreshToken: "fake-refresh-token",
    user: UserModel(
      email: "test@test.com",
      id: "1234567890",
      profilePicture: "http//:google.com",
      userName: "test user",
    ),
  );

  group('AuthPayloadModel', () {
    test('it should be an instance of AuthPayloadDto', () {
      expect(authPayloadModel, isA<AuthPayloadDto>());
    });
  });

  group('AuthPayloadModel.fromJson', () {
    test(
        'it should return a valid AuthPayloadModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("auth_payload_fixture.json"));

      // act
      final res = AuthPayloadModel.fromJson(jsonMap);

      // assert
      expect(res, authPayloadModel);
    });
  });
}
