import 'package:crypto_journal_mobile/app/auth/presentation/pages/settings/widgets/log_out_button.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/pages/settings/widgets/settings_section.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/user_auth_state.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/user_auth_state_notifier.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_page_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/section_header.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SettingsPage");

    return DefaultPageContainer(
      child: Column(
        children: [
          SectionHeader(
            title: "Settings",
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final state = watch(userAuthStateNotifierProvider);

                if (state is InitialUserAuthState ||
                    state is LoadingUserAuthState) {
                  return DefaultCircularProgressIndicator();
                }

                if (state is NotLoggedUserAuthState) {
                  return Center(
                    child: LogOutButton(),
                  );
                }

                if (state is LoggedUserAuthState) {
                  return SingleChildScrollView(
                    child: SettingsSection(
                      user: state.user,
                    ),
                  );
                }

                return ErrorPlaceholder();
              },
            ),
          ),
        ],
      ),
    );
  }
}
