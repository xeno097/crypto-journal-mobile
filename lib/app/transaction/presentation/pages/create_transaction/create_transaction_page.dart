import "package:flutter/material.dart";

class CreateTransactionPage extends StatelessWidget {
  static final route = "/create-transaction";

  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Create Transaction page"),
        ),
      ),
    );
  }
}
