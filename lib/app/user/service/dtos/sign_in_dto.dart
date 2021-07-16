import 'package:equatable/equatable.dart';

class SignInDto extends Equatable {
  final String token;

  SignInDto({
    required this.token,
  });

  @override
  List<Object?> get props => [
        this.token,
      ];
}
