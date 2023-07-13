import 'package:flutter/services.dart';

class InputType {
  static const String cARDNUMBER = 'card';
  static const String mMYY = 'mmyy';
  static const String cVV = 'cvv';
  static const String zIP = 'zip';
}

class CreditCardFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  CreditCardFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        String lastEnteredChar =
            newValue.text.substring(newValue.text.length - 1);

        /// if the input is not number return the last one
        if (!_isNumeric(lastEnteredChar)) return oldValue;

        /// if the length of the input text is grater than the value we inseart
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          String value = _validateValue(oldValue.text);
          // print(value);

          return TextEditingValue(
            text: '$value$separator$lastEnteredChar',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }

        if (newValue.text.length == mask.length) {
          return TextEditingValue(
            text: _validateValue(newValue.text),
            selection: TextSelection.collapsed(
              offset: newValue.selection.end,
            ),
          );
        }
      }
    }
    return newValue;
  }

  bool _isNumeric(String? s) {
    if (s == null) return false;
    return double.parse(s) != null;
  }

  String _validateValue(String s) {
    String result = s;
    // print("value after validation:" + result);
    return result;
  }
}
