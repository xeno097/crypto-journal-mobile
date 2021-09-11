import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';

class UserModel extends UserDto {
  UserModel({
    required String id,
    required String userName,
    required String profilePicture,
    required String email,
  }) : super(
          id: id,
          userName: userName,
          profilePicture: profilePicture,
          email: email,
        );

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    return UserModel(
      id: jsonMap["id"] ?? "",
      userName: jsonMap["userName"] ?? "",
      profilePicture: jsonMap["profilePicture"] ?? "",
      email: jsonMap["email"] ?? "",
    );
  }
}
