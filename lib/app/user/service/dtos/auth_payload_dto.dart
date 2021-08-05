import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:equatable/equatable.dart';

class AuthPayloadDto extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserDto user;

  AuthPayloadDto({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  @override
  List<Object?> get props => [
        this.accessToken,
        this.refreshToken,
        this.user,
      ];
}
