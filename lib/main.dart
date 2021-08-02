import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoginPage.route: (context) => LoginPage(),
        HomePage.route: (context) => HomePage(),
        SplashScreen.route: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}
