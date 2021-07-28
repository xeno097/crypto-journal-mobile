import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFF2B2D42),
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
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth / 2,
                          child: Text(
                            "Manage your crypto investements",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
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
                        backGroundColor: Color(0xFFC75749),
                        child: Center(
                          child: Text(
                            "Sign in with google",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: BaseButton(
                        backGroundColor: Color(0xFF375299),
                        child: Center(
                          child: Text(
                            "Sign in with Facebook",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    BaseButton(
                      backGroundColor: Colors.transparent,
                      child: Center(
                        child: Text(
                          "About the app",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
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

class BaseButton extends StatelessWidget {
  final Widget child;
  final Color backGroundColor;

  const BaseButton({
    Key? key,
    required this.child,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 40.0,
          width: constraints.maxWidth / 2,
          child: this.child,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 2.0,
                blurRadius: 4.0,
                offset: Offset(
                  4.0,
                  4.0,
                ),
              ),
            ],
            color: this.backGroundColor,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        );
      },
    );
  }
}
