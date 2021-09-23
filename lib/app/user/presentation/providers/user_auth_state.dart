import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';

abstract class UserAuthState {}

class InitialUserAuthState extends UserAuthState {}

class LoadingUserAuthState extends UserAuthState {}

class LoggedUserAuthState extends UserAuthState {
  final UserDto user;

  LoggedUserAuthState({
    required this.user,
  });
}

class NotLoggedUserAuthState extends UserAuthState {}

class ErrorLoggedUserAuthState extends UserAuthState {}
