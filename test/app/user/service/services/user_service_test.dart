import 'dart:convert';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/app/user/service/services/user_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../shared/fixtures/fixture_reader.dart';
import 'user_service_test.mocks.dart';

@GenerateMocks([IUserRepository])
void main() {
  late MockIUserRepository userRepositoryMock;
  late UserService userService;

  final userJson = json.decode(fixtureReader("user_fixture.json"));
  final userDto = UserModel.fromJson(userJson);

  setUp(() {
    userRepositoryMock = MockIUserRepository();
    userService = UserService(
      userRepository: userRepositoryMock,
    );
  });

  group("UserService.getLoggedUser", () {
    test('should call the getUser method of the IUserRepository class',
        () async {
      // arrange
      when(userRepositoryMock.getUser())
          .thenAnswer((realInvocation) => Future.value(Right(userDto)));

      // act
      final res = await userService.getLoggedUser();

      // assert
      verify(userRepositoryMock.getUser());
      expect(res, equals(Right(userDto)));
    });
  });

  group("UserService.updateLoggedUser", () {
    test('should call the updateUser method of the IUserRepository class',
        () async {
      // arrange
      when(userRepositoryMock.updateUser(any))
          .thenAnswer((realInvocation) => Future.value(Right(userDto)));

      // act
      final res = await userService.updateLoggedUser(UpdateUserDto());

      // assert
      verify(userRepositoryMock.updateUser(UpdateUserDto()));
      expect(res, equals(Right(userDto)));
    });
  });
}
