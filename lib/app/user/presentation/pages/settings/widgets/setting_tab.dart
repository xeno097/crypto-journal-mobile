import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/shadows.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  final double _settingTabHeight = 50.0;
  final String title;
  final List<Widget> children;

  const SettingTab({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  List<Widget> _sectionBuilder() {
    return this
        .children
        .map(
          (child) => Expanded(
            child: Container(
              child: child,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(
                10.0,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              this.title,
              style: defaultTextStyle,
            ),
          ),
          LayoutContainer(
            height: this.children.length * this._settingTabHeight,
            child: Container(
              child: Column(
                children: this._sectionBuilder(),
              ),
              decoration: BoxDecoration(
                boxShadow: defaultElementShadow,
                color: backGroundColorSecondary,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
