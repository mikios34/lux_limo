// import 'package:beyride/api/mutaion.dart';
// import 'package:beyride/controller/place_controller.dart';
// import 'package:beyride/model/vehicle.dart';
// import 'package:beyride/screens/loading_progress_indicator.dart';
// import 'package:beyride/screens/success_checkout_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class Reservation extends StatefulWidget {
//   Reservation({super.key, required this.data, required this.vehicle});
//   final Map<String, dynamic> data;
//   final Vehicle vehicle;

//   @override
//   State<Reservation> createState() => _ReservationState();
// }

// class _ReservationState extends State<Reservation> {
//   bool _isloading = false;

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   PlaceController placeController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     PlaceController placeController = Get.find();

//     final vehiclePrice = (widget.vehicle.price *
//         placeController.direction.distanceValue *
//         0.000621371);
//     final servicefee = ((widget.vehicle.price *
//             placeController.direction.distanceValue *
//             0.000621371) *
//         0.13);
//     final tax = ((widget.vehicle.price *
//             placeController.direction.distanceValue *
//             0.000621371) *
//         0.19);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         toolbarHeight: 70,
//         title: Text(
//           "Booking Detail",
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w500,
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back_ios_new),
//           color: Colors.black,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Price Summary",
//                       style: GoogleFonts.inter(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black)),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   _buildPriceSummaryItems(
//                       "Reservation", vehiclePrice.toStringAsFixed(2), context),
//                   // _buildPriceSummaryItems(
//                   //     "Service fee", servicefee.toStringAsFixed(2), context),
//                   _buildPriceSummaryItems(
//                       "Tax ", tax.toStringAsFixed(2), context),
//                   Container(
//                     height: 0.1,
//                     color: Colors.black,
//                     width: double.infinity,
//                     margin: const EdgeInsets.only(
//                       left: 20,
//                       top: 20,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Flexible(
//                         flex: 2,
//                         child: Row(
//                           children: [
//                             Text("Total",
//                                 style: Theme.of(context).textTheme.bodyLarge),
//                           ],
//                         ),
//                       ),
//                       Flexible(
//                           flex: 1,
//                           child: Text.rich(
//                               // textAlign: TextAlign.left,
//                               TextSpan(
//                                   text: '\$ ',
//                                   style: GoogleFonts.inter(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                   ),
//                                   children: [
//                                 TextSpan(
//                                   text: (servicefee + vehiclePrice + tax)
//                                       .toStringAsFixed(1),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleLarge!
//                                       .copyWith(fontSize: 16),
//                                 )
//                               ]))),
//                       const Spacer()
//                     ],
//                   ),

//                   // Row(
//                   //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     const SizedBox(
//                   //       width: 15,
//                   //     ),
//                   //     Flexible(
//                   //       flex: 2,
//                   //       child: Row(
//                   //         children: [
//                   //           Text("Total =",
//                   //               style: Theme.of(context).textTheme.bodyLarge),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Flexible(
//                   //       flex: 2,
//                   //       child: Container(
//                   //         child: Text.rich(
//                   //             // textAlign: TextAlign.left,
//                   //             TextSpan(
//                   //                 text: (servicefee + vehiclePrice + tax)
//                   //                     .toStringAsFixed(2),
//                   //                 style: Theme.of(context).textTheme.titleLarge,
//                   //                 children: [
//                   //               TextSpan(
//                   //                 text: '  \$ ',
//                   //                 style: GoogleFonts.inter(
//                   //                   fontWeight: FontWeight.w400,
//                   //                   fontSize: 8,
//                   //                   color: Colors.grey,
//                   //                 ),
//                   //               )
//                   //             ])),
//                   //       ),
//                   //     ),
//                   //     const Spacer()
//                   //   ],
//                   // ),
//                   const SizedBox(
//                     height: 20,
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 10,
//               width: double.infinity,
//               color: const Color.fromRGBO(248, 248, 248, 1),
//             ),
//             //////////////////////////////////////////////
//             ///
//             ///
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ////////////////////
//                         Text("Add Payment",
//                             style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black)),

//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: const [
//                               Image(
//                                   width: 25,
//                                   image: AssetImage('assets/master_logo.png')),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Image(
//                                   width: 25,
//                                   image: AssetImage('assets/visa_logo.png')),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Image(
//                                   width: 25,
//                                   image: AssetImage(
//                                       'assets/american_express_logo .png')),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Image(
//                                   width: 25,
//                                   image: AssetImage('assets/discover_logo.png'))
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       onSaved: (newValue) {
//                         widget.data['last4_digit'] = newValue;
//                       },
//                       decoration: InputDecoration(
//                         fillColor: Color.fromRGBO(248, 248, 248, 1),
//                         filled: true,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                         labelText: 'Card Number',
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Row(
//                       children: [
//                         Flexible(
//                             child: TextFormField(
//                           // focusNode: mmYYFocus,
//                           onSaved: (newValue) {
//                             // widget.data['month'] = newValue;
//                           },
//                           decoration: InputDecoration(
//                             labelText: 'MM/YY',
//                             fillColor: Color.fromRGBO(248, 248, 248, 1),
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide.none),
//                           ),
//                         )),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Flexible(
//                             child: TextFormField(
//                           onSaved: (newValue) {
//                             // widget.data['cvc'] = newValue;
//                           },
//                           // focusNode: cvvFocus,
//                           keyboardType: TextInputType.phone,
//                           // maxLength: util.cardType == "American express" ? 4 : 3,
//                           decoration: InputDecoration(
//                             fillColor: Color.fromRGBO(248, 248, 248, 1),
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide.none),
//                             labelText: 'CVC',
//                             counterText: "",
//                             counterStyle: TextStyle(
//                               height: double.minPositive,
//                             ),
//                           ),
//                         )),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     TextFormField(
//                       onSaved: (newValue) {
//                         // widget.data['zip_code'] = newValue;
//                       },
//                       // focusNode: cvvFocus,
//                       keyboardType: TextInputType.phone,
//                       // maxLength: util.cardType == "American express" ? 4 : 3,
//                       decoration: InputDecoration(
//                         fillColor: Color.fromRGBO(248, 248, 248, 1),
//                         filled: true,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                         labelText: 'Zip Code',
//                         counterText: "",
//                         counterStyle: TextStyle(
//                           height: double.minPositive,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     CheckboxListTile(
//                         contentPadding: EdgeInsets.zero,
//                         controlAffinity: ListTileControlAffinity.leading,
//                         checkColor: Colors.white,
//                         dense: true,
//                         side: const BorderSide(color: Colors.black, width: 0.5),
//                         activeColor: Colors.black,
//                         checkboxShape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                         title: Text(
//                           "Save Card for Future use",
//                           style: GoogleFonts.inter(
//                               fontStyle: FontStyle.normal,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,
//                               fontSize: 13),
//                         ),
//                         value: false,
//                         onChanged: (value) {
//                           // cardController.saveCardForFutureUse.value = value!;
//                         }),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: InkWell(
//                         onTap: () async {
//                           // await launchUrl(
//                           //     Uri.parse(result.data!['getAgreementandTerms']),
//                           //     mode: LaunchMode.inAppWebView);
//                         },
//                         child: Text.rich(
//                           TextSpan(
//                               text: "By booking you agree our ".tr,
//                               style: GoogleFonts.inter(
//                                   fontStyle: FontStyle.normal,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.grey,
//                                   fontSize: 10),
//                               children: [
//                                 TextSpan(
//                                     text: "TERMS and Conditions",
//                                     style: GoogleFonts.inter(
//                                         fontStyle: FontStyle.normal,
//                                         fontWeight: FontWeight.w400,
//                                         color: const Color.fromRGBO(
//                                             53, 60, 236, 1),
//                                         fontSize: 10))
//                               ]),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                         height: 50,
//                         child: Mutation(
//                             options: MutationOptions(
//                                 onCompleted: (data) {
//                                   debugPrint("data is $data");
//                                   Navigator.pop(context);
//                                   if (data != null) {
//                                     Get.to(SuccessCheckoutPage(
//                                       vehicle: widget.vehicle,
//                                       data: widget.data,
//                                     ));
//                                   }
//                                 },
//                                 document: gql(addReservation)),
//                             builder: (runMutation, result) {
//                               return ElevatedButton(
//                                   style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all(
//                                               const Color.fromRGBO(
//                                                   88, 146, 183, 1))),
//                                   onPressed: () {
//                                     _formKey.currentState!.save();

//                                     showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return LoadinProgressIndicator();
//                                       },
//                                     );
//                                     widget.data['pickup'] = placeController
//                                         .pickupLoaction!.placeName;
//                                     widget.data['dropoff'] = placeController
//                                         .droppOffLocation!.placeName;
//                                     widget.data['distance'] = (placeController
//                                         .direction.distanceValue);

//                                     widget.data['price'] = ((placeController
//                                                 .direction.distanceValue /
//                                             1000) *
//                                         widget.vehicle.price);
//                                     widget.data['service_fee'] = 7.5;
//                                     widget.data['total_paid'] = 345;

//                                     runMutation(
//                                         {"reservationInput": widget.data});
//                                   },
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       // if (cardController.loading.value) const Spacer(),
//                                       Text(
//                                         "Reserve",
//                                         style: GoogleFonts.inter(
//                                           fontStyle: FontStyle.normal,
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       // if (cardController.loading.value) const Spacer(),
//                                       // if (cardController.loading.value)
//                                       //   const SizedBox(
//                                       //     height: 20,
//                                       //     width: 20,
//                                       //     child: CircularProgressIndicator(
//                                       //       color: Colors.black,
//                                       //       strokeWidth: 1,
//                                       //     ),
//                                       //   )
//                                     ],
//                                   ));
//                             })),
//                   ],
//                 ),
//               ),
//             )

// /////////////////////////////////
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPriceSummaryItems(
//       String key, String value, BuildContext context) {
//     return Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const SizedBox(
//           width: 15,
//         ),
//         Flexible(
//           flex: 2,
//           child: Row(
//             children: [
//               Text(key,
//                   style: Theme.of(context)
//                       .textTheme
//                       .labelMedium!
//                       .copyWith(color: Colors.grey.shade600)),
//             ],
//           ),
//         ),
//         Flexible(
//           flex: 1,
//           child: Text(value,
//               textAlign: TextAlign.left,
//               style: Theme.of(context)
//                   .textTheme
//                   .labelMedium!
//                   .copyWith(color: Colors.grey.shade600)),
//         ),
//         const Spacer()
//       ],
//     );
//   }
// }
