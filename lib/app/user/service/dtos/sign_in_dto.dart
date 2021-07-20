import 'package:equatable/equatable.dart';

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

enum SIGN_IN_PROVIDER {
  GOOGLE,
}
