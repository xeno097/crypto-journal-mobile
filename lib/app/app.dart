import 'package:crypto_journal_mobile/app/user/presentation/pages/splash/splash_screen.dart';
import 'package:crypto_journal_mobile/shared/routes/routes.dart';
import "package:flutter/material.dart";

class CryptoJournalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      initialRoute: SplashScreen.route,
    );
  }
}
