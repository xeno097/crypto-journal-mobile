import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backGroundColorPrimary,
        alignment: Alignment.center,
        padding: EdgeInsets.all(
          21.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    " Start your hodling journey",
                    textAlign: TextAlign.center,
                    style: mainTitleTextStyle,
                  ),
                  Container(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth / 2,
                          child: Text(
                            "Track your crypto investements",
                            textAlign: TextAlign.center,
                            style: subTitleTextStyle,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: BaseButton(
                        backGroundColor: googleButtonBackGroundColor,
                        child: Center(
                          child: Text(
                            "Sign in with google",
                            style: defaultTextStyle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: BaseButton(
                        backGroundColor: facebookButtonBackGroundColor,
                        child: Center(
                          child: Text(
                            "Sign in with Facebook",
                            style: defaultTextStyle,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      child: Center(
                        child: Text(
                          "About the app",
                          style: secondaryTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
