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

  test('it should be a subclass of UserDto', () {
    expect(userModel, isA<UserDto>());
  });

  group('fromJson', () {
    // TODO: test when one of the fields is missing
    test('it should return a valid UserModel when a valid json is provided',
        () {
      final Map<String, dynamic> jsonMap = {
        "id": "1234567890",
        "userName": "test",
        "profilePicture": "http//:google.com",
        "email": "test@email.com",
      };

      final res = UserModel.fromJson(jsonMap);

      expect(res, userModel);
    });
  });
}
