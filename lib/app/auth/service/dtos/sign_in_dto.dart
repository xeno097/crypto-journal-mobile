import 'package:equatable/equatable.dart';

enum SIGN_IN_PROVIDER {
  GOOGLE,
  FACEBOOK,
}

class SignInDto extends Equatable {
  final SIGN_IN_PROVIDER provider;

  SignInDto({
    required this.provider,
  });

  @override
  List<Object?> get props => [
        this.provider,
      ];
}
