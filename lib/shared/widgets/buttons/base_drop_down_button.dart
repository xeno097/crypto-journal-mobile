import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import "package:flutter/material.dart";

class BaseDropDownButton extends StatefulWidget {
  final void Function(String) onChanged;
  final List<DropdownMenuItem<String>> items;

  BaseDropDownButton({
    Key? key,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  _BaseDropDownButtonState createState() => _BaseDropDownButtonState();
}

class _BaseDropDownButtonState extends State<BaseDropDownButton> {
  String? _currentValue;
  late final List<DropdownMenuItem<String>> _items;

  @override
  void initState() {
    super.initState();
    this._items = this.widget.items;

    if (this._items.length != 0) {
      this._currentValue = this._items[0].value;
    }
  }

  void _setCurrentValue(String? selectedValue) {
    setState(() {
      if (selectedValue != null) {
        this.widget.onChanged(selectedValue);
        this._currentValue = selectedValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: this._currentValue,
      dropdownColor: backGroundColorPrimary,
      onChanged: this._setCurrentValue,
      underline: Container(),
      items: this._items,
    );
  }
}
