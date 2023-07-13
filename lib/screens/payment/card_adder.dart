import 'package:beyride/constant.dart';
import 'package:beyride/screens/payment/util/card_formatter.dart';
import 'package:beyride/screens/payment/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CardAdderPage extends StatefulWidget {
  const CardAdderPage({super.key, this.refetch});
  State<CardAdderPage> createState() => _CardAdderPageState();
  final Future<QueryResult<Object?>?> Function()? refetch;
}

class _CardAdderPageState extends State<CardAdderPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {};

  final util = CustomeFunctionalities();
  final cardnum = FocusNode();
  final mmYYFocus = FocusNode();
  final cvvFocus = FocusNode();
  final cardController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String cardType;

  String? logoUrl;

  @override
  Widget build(BuildContext context) {
    // CardController cardController = Get.find();
    // CardController cardController = Get.put(CardController());
    // PlaceController placeController = Get.find();
    CurrencySelectorController currencySelectorController =
        Get.put(CurrencySelectorController());
    // UserProfileController userProfileController = Get.find();

    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Payment Card",
                style: GoogleFonts.inter(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                            width: 30,
                            image: AssetImage('assets/master_logo.png')),
                        SizedBox(
                          width: width * 1.5,
                        ),
                        const Image(
                            width: 30,
                            image: AssetImage('assets/visa_logo.png')),
                        SizedBox(
                          width: width * 1.5,
                        ),
                        const Image(
                            width: 30,
                            image: AssetImage(
                                'assets/american_express_logo .png')),
                        SizedBox(
                          width: width * 1.5,
                        ),
                        const Image(
                            width: 30,
                            image: AssetImage('assets/discover_logo.png'))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                style: inputTextStyle,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Card Number'.tr,
                  suffixIcon: logoUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(width: 30, image: AssetImage(logoUrl!)),
                        )
                      : null,
                ),
                onSaved: (newValue) {
                  data['number'] = newValue;
                },
                inputFormatters: [
                  CreditCardFormatter(
                    mask: util.cardType == "American express"
                        ? 'xxxx xxxxxx xxxxx'
                        : 'xxxx xxxx xxxx xxxx',
                    separator: ' ',
                  ),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                ],
                onChanged: (value) {
                  setState(() {
                    util.chageImage(value);
                    cardType = util.cardBrandChecker();
                    if (value.length > 4) {
                      switch (cardType) {
                        case "American express":
                          logoUrl = "assets/american_express_logo .png";

                          break;
                        case "Visa":
                          logoUrl = "assets/visa_logo.png";

                          break;
                        case "Master Card":
                          logoUrl = "assets/master_logo.png";

                          break;
                        case "Discovery":
                          logoUrl = "assets/discover_logo.png";

                          break;
                        default:
                      }
                    }

                    if (cardType == "American express") {
                      data['number'] = (value.replaceAll(" ", ''));
                      if (value.length == 17) {
                        FocusScope.of(context).requestFocus(mmYYFocus);
                      }
                    } else {
                      data['number'] = (value.replaceAll(" ", ''));

                      if (value.length == 19) {
                        FocusScope.of(context).requestFocus(mmYYFocus);
                      }
                    }
                  });
                  // util.chageImage(value);
                },
                validator: (value) {
                  return util.cardNumberValidater(value!.replaceAll(' ', ''));
                },
              ),
              SizedBox(
                height: height * 18 / height,
              ),
              Row(
                children: [
                  Flexible(
                      child: TextFormField(
                    style: inputTextStyle,
                    keyboardType: TextInputType.phone,
                    focusNode: mmYYFocus,
                    decoration:
                        InputDecoration(hintText: 'MM/YY'.tr, filled: true),
                    onSaved: (newValue) {
                      data['exp_month'] = newValue!.split('/')[0];
                      data['exp_year'] = newValue.split('/')[1];
                    },
                    inputFormatters: [
                      CreditCardFormatter(
                        mask: 'XX/XX',
                        separator: '/',
                      ),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                    ],
                    onChanged: (value) {
                      if (value.toString().length == 5) {
                        FocusScope.of(context).requestFocus(cvvFocus);
                      }
                    },
                    validator: (value) {
                      RegExp calenderDate = RegExp(r'^[0-9]{2}[/]{1}[0-9]{2}$');
                      if (!calenderDate.hasMatch(value.toString())) {
                        return "Incorrect Format MM/YY".tr;
                      }

                      return null;
                      // if (value!.isEmpty) {
                      //   return "required";
                      // }
                    },
                  )),
                  SizedBox(
                    width: width * 15 / width,
                  ),
                  Flexible(
                      child: TextFormField(
                    style: inputTextStyle,
                    focusNode: cvvFocus,
                    keyboardType: TextInputType.phone,
                    maxLength: util.cardType == "American express" ? 4 : 3,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'CVC'.tr,
                      counterText: "",
                      counterStyle: const TextStyle(
                        height: double.minPositive,
                      ),
                    ),
                    onSaved: (newValue) {
                      data['cvc'] = newValue;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (util.cardType == "American express") {
                        if (value == null || value.toString().length != 4) {
                          return 'CVC required'.tr;
                        }
                      } else {
                        if (value == null || value.toString().length != 3) {
                          return 'CVC required'.tr;
                        }
                      }
                      return null;
                    },
                  ))
                ],
              ),
              SizedBox(
                height: 26,
              ),
              // Obx(() {
              //   return CheckboxListTile(
              //       contentPadding: EdgeInsets.zero,
              //       controlAffinity: ListTileControlAffinity.leading,
              //       checkColor: Colors.white,
              //       dense: true,
              //       side: const BorderSide(color: Colors.black, width: 0.5),
              //       activeColor: Colors.black,
              //       checkboxShape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(3),
              //       ),
              //       title: Text(
              //         "Save Card for Future use".tr,
              //         style: GoogleFonts.inter(
              //             fontStyle: FontStyle.normal,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black,
              //             fontSize: 13),
              //       ),
              //       value: cardController.saveCardForFutureUse.value,
              //       onChanged: (value) {
              //         cardController.saveCardForFutureUse.value = value!;
              //       });
              // }),
              // SizedBox(
              //   height: height * 2,
              // ),
              ElevatedButton(
                  onPressed: false == false
                      ? () async {
                          final form = _formKey.currentState;
                          // if (form!.validate()) {
                          //   form.save();
                          //   cardController.loading.value = true;

                          //   runMutation({
                          //     "paymentMethodInput": {
                          //       "user_id": GetStorage().read('uid'),
                          //       "customer_id": userProfileController
                          //           .user.customerId,
                          //       'number': data['number'],
                          //       'exp_month': data['exp_month'],
                          //       'exp_year': data['exp_year'],
                          //       "cvc": data['cvc'],
                          //       "isSave": cardController
                          //           .saveCardForFutureUse.value,
                          //       "type": "card",
                          //       "currency": currencySelectorController
                          //           .selectedCurrency.value
                          //     }
                          //   });
                          // }
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // if (cardController.loading.value)
                      //   const Spacer(),
                      Text(
                        "Add Card".tr,
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      // if (cardController.loading.value)
                      //   const Spacer(),
                      // if (cardController.loading.value)
                      //   const SizedBox(
                      //     height: 20,
                      //     width: 20,
                      //     child: CircularProgressIndicator(
                      //       color: Colors.black,
                      //       strokeWidth: 1,
                      //     ),
                      //   )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencySelectorController extends GetxController {
  var selectedCurrency = ''.obs;
}
