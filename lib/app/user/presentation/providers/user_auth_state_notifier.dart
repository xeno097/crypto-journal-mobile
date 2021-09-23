import 'package:crypto_journal_mobile/app/user/presentation/providers/user_auth_state.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/services/user_service.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_error.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAuthStateNotifierProvider =
    StateNotifierProvider.autoDispose<UserAuthStateNotifier, UserAuthState>(
  (
    ProviderReference ref,
  ) =>
      UserAuthStateNotifier(
    providerReference: ref,
  ),
);

class UserAuthStateNotifier extends StateNotifier<UserAuthState> {
  late final ProviderReference _providerReference;
  late final IUserService _userService;

  UserAuthStateNotifier({
    required ProviderReference providerReference,
  }) : super(InitialUserAuthState()) {
    this._providerReference = providerReference;
    this._initState();
  }

  void _initState() async {
    this.state = LoadingUserAuthState();

    this._userService = await this._providerReference.read(
          userServiceProvider.future,
        );

    final ref = await this._userService.getLoggedUser();

    ref.fold(
      (err) => this._setErrorState(err),
      (user) => this._setLoggedState(user),
    );
  }

  void _setErrorState(BaseError err) {
    handleProviderErrorResult(
      providerReference: this._providerReference,
      error: err,
      callback: () => {},
    );

    if (err is UnauthorizedUserError || err is BlockedUserError) {
      this.state = NotLoggedUserAuthState();
      return;
    }

    this.state = ErrorLoggedUserAuthState();
  }

  void _setLoggedState(UserDto user) {
    this.state = LoggedUserAuthState(
      user: user,
    );
  }
}
