import 'package:equatable/equatable.dart';

class UpdateUserDto extends Equatable {
  final String? userName;
  final String? profilePicture;

  UpdateUserDto({
    this.userName,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [
        this.profilePicture,
        this.userName,
      ];
}
