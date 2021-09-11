import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import "package:flutter/material.dart";

abstract class DropDownListItem {
  String get id;
  String get name;
}

class DefaultDropDownButton extends StatefulWidget {
  final List<DropDownListItem> options;
  final void Function(String)? onChanged;

  const DefaultDropDownButton({
    Key? key,
    this.onChanged,
    required this.options,
  }) : super(key: key);

  @override
  _DefaultDropDownButtonState createState() => _DefaultDropDownButtonState();
}

class _DefaultDropDownButtonState extends State<DefaultDropDownButton> {
  String? _selectedValue;
  void Function(String)? _onChanged;

  @override
  void initState() {
    super.initState();

    this._onChanged = this.widget.onChanged;

    if (this.widget.options.length != 0) {
      this._selectedValue = this.widget.options[0].id;
      if (this._onChanged != null) {
        this._onChanged!(this._selectedValue!);
      }
    }
  }

  List<DropdownMenuItem<String>> _formatOperationTypes(
      List<DropDownListItem> items, double height) {
    final optionList = items.map(
      (DropDownListItem element) => DropdownMenuItem(
        value: element.id,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            element.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: defaultTextStyle.copyWith(
              fontSize: height * primaryTextStyleSize / defaultHeight,
            ),
          ),
        ),
      ),
    );

    return optionList.toList();
  }

  void _setSelectedValue(String? value) {
    if (value != null) {
      setState(() {
        this._selectedValue = value;
        if (this._onChanged != null) {
          this._onChanged!(this._selectedValue!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        final height = size.height;

        return DefaultContainer(
          child: Center(
            child: DropdownButton<String>(
              underline: Container(),
              isExpanded: true,
              dropdownColor: backGroundColorPrimary,
              value: this._selectedValue,
              items: this._formatOperationTypes(this.widget.options, height),
              onChanged: this._setSelectedValue,
            ),
          ),
        );
      },
    );
  }
}
