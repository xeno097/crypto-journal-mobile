import 'package:equatable/equatable.dart';

class UpdateUserInput extends Equatable {
  final String? userName;
  final String? profilePicture;

  UpdateUserInput({
    this.userName,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [this.userName, this.userName];

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
