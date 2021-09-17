import 'package:equatable/equatable.dart';

enum SIGN_IN_PROVIDER {
  GOOGLE,
  FACEBOOK,
}

abstract class SignInProviderExtension {
  static SIGN_IN_PROVIDER fromString(String value) {
    if (value == SIGN_IN_PROVIDER.GOOGLE.toString()) {
      return SIGN_IN_PROVIDER.GOOGLE;
    }

    if (value == SIGN_IN_PROVIDER.FACEBOOK.toString()) {
      return SIGN_IN_PROVIDER.FACEBOOK;
    }

    throw Exception();
  }
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
