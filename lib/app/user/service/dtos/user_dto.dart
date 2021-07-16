import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final String id;
  final String userName;
  final String profilePicture;
  final String email;

  const UserDto({
    required this.id,
    required this.userName,
    required this.profilePicture,
    required this.email,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.userName,
        this.profilePicture,
        this.email,
      ];
}
