import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';

class UpdateUserInput extends UpdateUserDto {
  UpdateUserInput({
    String? userName,
    String? profilePicture,
  }) : super(
          profilePicture: profilePicture,
          userName: userName,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {};

    if (this.profilePicture != null) {
      jsonMap["profilePicture"] = this.profilePicture;
    }
    if (this.userName != null) {
      jsonMap["userName"] = this.userName;
    }

    return jsonMap;
  }
}
