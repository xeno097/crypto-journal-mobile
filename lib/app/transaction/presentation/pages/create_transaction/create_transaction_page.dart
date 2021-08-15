import 'package:crypto_journal_mobile/app/user/presentation/pages/home/widgets/tab_container.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";

class CreateTransactionPage extends StatelessWidget {
  static final route = "/create-transaction";

  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColorPrimary,
      body: SafeArea(
        child: TabContainer(
          header: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Create Transaction",
              style: pageTitleTextStyle,
            ),
          ),
          body: Container(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreateTransactionFormTab(
                    fieldName: "Coins",
                    primaryInput: Center(
                      child: Text(
                        "0.67",
                        style: defaultTextStyle,
                      ),
                    ),
                    secondaryInput: Center(
                      child: Text(
                        "ETH",
                        style: defaultTextStyle,
                      ),
                    ),
                  ),
                  CreateTransactionFormTab(
                    fieldName: "Price",
                    primaryInput: Center(
                      child: Text(
                        "3567.67",
                        style: defaultTextStyle,
                      ),
                    ),
                    secondaryInput: Center(
                      child: Text(
                        "USD",
                        style: defaultTextStyle,
                      ),
                    ),
                  ),
                  CreateTransactionFormTab(
                    fieldName: "Fees",
                    primaryInput: Center(
                      child: Text(
                        "0.89",
                        style: defaultTextStyle,
                      ),
                    ),
                    secondaryInput: Center(
                      child: Text(
                        "ETH",
                        style: defaultTextStyle,
                      ),
                    ),
                  ),
                  CreateTransactionFormTab(
                    fieldName: "Date",
                    primaryInput: Center(
                      child: Text(
                        "11/06/2020",
                        style: defaultTextStyle,
                      ),
                    ),
                  ),
                  CreateTransactionFormTab(
                    fieldName: "Type",
                    primaryInput: Container(
                      child: Center(
                        child: Text(
                          "BUY",
                          style: defaultTextStyle,
                        ),
                      ),
                    ),
                  ),
                  CreateTransactionFormInfoTab(
                    fieldName: "Sub-total",
                    value: "\$89",
                  ),
                  CreateTransactionFormInfoTab(
                    fieldName: "Total",
                    value: "\$90",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateTransactionFormInfoTab extends StatelessWidget {
  final String fieldName;
  final String value;

  const CreateTransactionFormInfoTab({
    Key? key,
    required this.fieldName,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: LayoutContainer(
        height: 25.0,
        width: ContainerWidth.Full,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  this.fieldName,
                  style: defaultTextStyle,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    this.value,
                    style: defaultTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    "USD",
                    style: defaultTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTransactionFormTab extends StatelessWidget {
  final String fieldName;
  final Widget primaryInput;
  final Widget? secondaryInput;

  const CreateTransactionFormTab({
    Key? key,
    this.secondaryInput,
    required this.fieldName,
    required this.primaryInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: BaseButton(
        width: ContainerWidth.Full,
        backGroundColor: backGroundColorSecondary,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    this.fieldName,
                    style: defaultTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: this.secondaryInput == null ? 2 : 1,
                child: Container(),
              ),
              Expanded(
                child: this.primaryInput,
              ),
              this.secondaryInput == null
                  ? Container()
                  : Expanded(
                      child: this.secondaryInput!,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
