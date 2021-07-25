import 'dart:convert';

import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/user/service/services/auth_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'auth_service_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late MockIAuthRepository authRepositoryMock;
  late AuthService authService;

  final authPayloadJson =
      json.decode(fixtureReader("auth_payload_fixture.json"));
  final AuthPayloadModel authPayloadDto =
      AuthPayloadModel.fromJson(authPayloadJson);

  setUp(() {
    authRepositoryMock = MockIAuthRepository();
    authService = AuthService(
      authRepository: authRepositoryMock,
    );
  });

  group("AuthService.signIn", () {
    test('should call the signIn method of the IAuthRepository class',
        () async {
      // arrange
      when(authRepositoryMock.signIn(any))
          .thenAnswer((_) => Future.value(Right(authPayloadDto)));
      final SignInDto signInDto = SignInDto(provider: SIGN_IN_PROVIDER.GOOGLE);

      // act
      await authService.signIn(signInDto);

      // assert
      verify(authRepositoryMock.signIn(signInDto));
    });
  });

  group("AuthService.signOut", () {
    test('should call the signOut method of the IAuthRepository class',
        () async {
      // arrange
      when(authRepositoryMock.signOut())
          .thenAnswer((_) => Future.value(Right(true)));

      // act
      await authService.signOut();

      // assert
      verify(authRepositoryMock.signOut());
    });
  });
}
