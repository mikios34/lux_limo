import 'package:flutter/services.dart';

class CustomeFunctionalities {
  // int cardLength;
  String cardType = "";
  String cardPic = "";
  // String cardNumber;

  String chageImage(String value) {
    if (value.toString().startsWith("4") == true) {
      cardType = "Visa";

      cardPic = "assets/visaB.png";
    } else if (value.toString().startsWith("22") == true ||
        value.toString().startsWith("27") == true ||
        value.toString().startsWith("51") == true ||
        value.toString().startsWith("52") == true ||
        value.toString().startsWith("53") == true ||
        value.toString().startsWith("54") == true ||
        value.toString().startsWith("55") == true) {
      cardType = "Master Card";

      cardPic = "assets/mscard.png";
    } else if (value.toString().startsWith("34") == true ||
        value.toString().startsWith("37") == true) {
      cardType = "American express";

      cardPic = "assets/amex.png";
    } else if (value.toString().startsWith("6011") == true ||
        value.toString().startsWith("64") == true ||
        value.toString().startsWith("65") == true) {
      cardType = "Discovery";

      cardPic = "assets/discovery.png";
    } else {
      cardType = "Error";
      cardPic = "";
    }

    return cardPic;
  }

  String? cardNumberValidater(cardNumber) {
    String? isLengthCorrect;
    if (cardType == "Error" && cardNumber != null && cardNumber.isNotEmpty) {
      isLengthCorrect = 'Incorrect Card number ';
    }

    // if (submit) {
    if (cardType == "American express" && cardNumber.toString().length != 15) {
      isLengthCorrect = 'Incorrect Card number ';
    }

    if (cardNumber.toString().length != 16 && cardType != "American express") {

      isLengthCorrect = 'Incorrect Card number';
    }
    // }

    return isLengthCorrect;
  }

  String cardBrandChecker() {
    return cardType;
  }
}

class BeymartCustomTextController extends TextInputFormatter {
  final String
      theDigits; // can limit based on the length passed through the call
  final String theMiddleSpacer;

  BeymartCustomTextController({
    required this.theDigits,
    required this.theMiddleSpacer,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > theDigits.length) {
          return oldValue;
        } // LOGIC A

        if (newValue.text.length < theDigits.length &&
            theDigits[newValue.text.length - 1] == theMiddleSpacer) {
          return TextEditingValue(
              text:
                  '${oldValue.text}$theMiddleSpacer${newValue.text.substring(newValue.text.length - 1)}', // concatenate
              selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1,
              ));
        } // LOGIC B

      }
    }
    // print("the last text is " + newValue.text);
    return newValue;
  } // TextEditingValue ending

}
