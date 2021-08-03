import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.route: (context) => LoginPage(),
  HomePage.route: (context) => HomePage(),
  SplashScreen.route: (context) => SplashScreen(),
};
