import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String route = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("bobo"),
        ),
      ),
    );
  }
}
