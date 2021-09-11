import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';

class AuthPayloadModel extends AuthPayloadDto {
  AuthPayloadModel({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
          user: user,
        );

  factory AuthPayloadModel.fromJson(Map<String, dynamic> jsonMap) {
    return new AuthPayloadModel(
      accessToken: jsonMap['accessToken'],
      refreshToken: jsonMap['refreshToken'],
      user: UserModel.fromJson(
        jsonMap['user'],
      ),
    );
  }
}
