import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';

class UserModel extends UserDto {
  final String id;
  final String userName;
  final String profilePicture;
  final String email;

  UserModel({
    required this.id,
    required this.userName,
    required this.profilePicture,
    required this.email,
  }) : super(
          id: id,
          userName: userName,
          profilePicture: profilePicture,
          email: email,
        );

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    return UserModel(
      id: jsonMap["id"],
      userName: jsonMap["userName"],
      profilePicture: jsonMap["profilePicture"],
      email: jsonMap["email"],
    );
  }
}
